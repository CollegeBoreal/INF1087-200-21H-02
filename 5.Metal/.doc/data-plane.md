# :abacus: Plan de données `data plane` 

:round_pushpin: Joindre un noeud 

À l'initialisation du plan de contrôle, un :tickets: jeton à été donné avec la commande `kubeadm`, récupérer cette commande.

Elle devrait ressembler à la suivante:

```
$ sudo kubeadm join betelgeuse.boreal.codes:6443 \
               --token 2pje0m.xl8voke0wisjymvp   \
               --discovery-token-ca-cert-hash sha256:27c4b80df3d468bfe13517750a265bb3a3c560871e1bf177cafb323070b7b4a6
```

:bulb: :tickets: Gestion des Jetons

Si vous avez perdu le :tickets: jeton, ou que le jeton a expiré

- [ ] Sur le :control_knobs: plan de contrôle, afficher la liste des :tickets: Jetons

```
$ kubeadm token list
TOKEN                     TTL         EXPIRES                USAGES                   DESCRIPTION    EXTRA GROUPS
zlt7nb.lpd06ao1kxf4uwgm   23h         2021-03-05T19:51:22Z   authentication,signing   <none>         system:bootstrappers:kubeadm:default-node-token
```

- [ ] Si les jetons ont expirés, regénérer un jeton avec les commandes ci-dessous

```
$ kubeadm token create --print-join-command
W0304 19:51:22.390054 2541130 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]

kubeadm join orion.boreal.codes:6443 --token zlt7nb.lpd06ao1kxf4uwgm     --discovery-token-ca-cert-hash sha256:3aa3fe1dd88a80e7ea9e76408dd166947a606b7bd0f1ad089454ccf9a80c2365 
```

[:back:](../#abacus-les-plan-de-données-data-plane)


```
$ CA_CERT_HASH=`openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt \
    | openssl rsa -pubin -outform der 2>/dev/null \
    | openssl dgst -sha256 -hex \
    | sed 's/^.* //'`
```

```
$ TOKEN=<TOKEN PRIS DE LA LISTE>
```

```
$ sudo kubeadm join orion.boreal.codes:6443 --token ${TOKEN} --discovery-token-ca-cert-hash sha256:${CA_CERT_HASH}
```
