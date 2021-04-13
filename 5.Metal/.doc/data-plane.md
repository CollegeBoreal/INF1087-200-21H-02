# :abacus: Plan de données `data plane` 

:round_pushpin: Joindre un noeud 

À l'initialisation du plan de contrôle, un :tickets: jeton à été donné avec la commande `kubeadm`, récupérer cette commande.

Elle devrait ressembler à la suivante:

```
$ sudo kubeadm join betelgeuse.boreal.codes:6443 \
               --token 2pje0m.xl8voke0wisjymvp   \
               --discovery-token-ca-cert-hash sha256:27c4b80df3d468bfe13517750a265bb3a3c560871e1bf177cafb323070b7b4a6
```

[:back:](../#abacus-les-plan-de-données-data-plane)


## :cl: Gestion des Jetons :tickets: 

Si vous avez perdu le :tickets: jeton, ou que le jeton a expiré

:round_pushpin: Sur le :control_knobs: plan de contrôle, 

- [ ] Afficher la liste des :tickets: Jetons

Observer le champ `TTL` (Time To Live), il indique le temps restant avant expiration du jeton d'une durée de vie de 24h

```
$ kubeadm token list
TOKEN                     TTL         EXPIRES                USAGES                   DESCRIPTION                                                EXTRA GROUPS
seg7l8.5b6iz1mpixhtool4   17h         2021-04-05T12:12:01Z   authentication,signing   The default bootstrap token generated by 'kubeadm init'.   system:bootstrappers:kubeadm:default-node-token
```

:star: Si le jeton n'a pas expiré:

:control_knobs: Sur le plan de contrôle, récuperer les information suivantes

- [ ] Le hashage :hash: du certificat `SHA256`

```
$ openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt \
    | openssl rsa -pubin -outform der 2>/dev/null \
    | openssl dgst -sha256 -hex \
    | sed 's/^.* //'
```

- [ ] Le jeton :tickets: non expiré

```
$ kubeadm token list
```

:abacus: Sur le plan de données

- [ ] Donner les valeurs récupérées aux variables d'environnements suivantes: (par example)

```
$ CTL_PLANE="betelgeuse.boreal.codes"
$ TOKEN="seg7l8.5b6iz1mpixhtool4"
$ CA_CERT_HASH="c41ff0c3608120eaf7599bc77f6bc72b1e75c46caa073bb28cba21ea1f86f5ef"
```

- [ ] Exécuter la commande permettant de joindre la grappe

```
$ sudo kubeadm join ${CTL_PLANE}:6443 --token ${TOKEN} --discovery-token-ca-cert-hash sha256:${CA_CERT_HASH}
```

:round_pushpin: Si les jetons ont tous expirés, regénérer un jeton avec les commandes ci-dessous

:control_knobs: sur le plan de controle

```
$ kubeadm token create --print-join-command
W0304 19:51:22.390054 2541130 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]

kubeadm join betelgeuse.boreal.codes:6443 --token zlt7nb.lpd06ao1kxf4uwgm     --discovery-token-ca-cert-hash sha256:3aa3fe1dd88a80e7ea9e76408dd166947a606b7bd0f1ad089454ccf9a80c2365 
```

:abacus: sur le plan de données

```
$ sudo kubeadm join betelgeuse.boreal.codes:6443 --token zlt7nb.lpd06ao1kxf4uwgm     --discovery-token-ca-cert-hash sha256:3aa3fe1dd88a80e7ea9e76408dd166947a606b7bd0f1ad089454ccf9a80c2365 
```


# References

https://stackoverflow.com/questions/51126164/how-do-i-find-the-join-command-for-kubeadm-on-the-master

https://unix.stackexchange.com/questions/87405/how-can-i-execute-local-script-on-remote-machine-and-include-arguments

https://sdorsett.github.io/post/2018-12-26-using-local-exec-and-remote-exec-provisioners-with-terraform/