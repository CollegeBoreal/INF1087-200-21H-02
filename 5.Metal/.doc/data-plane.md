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
