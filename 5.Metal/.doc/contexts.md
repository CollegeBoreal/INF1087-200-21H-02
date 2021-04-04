# :card_index: Contexte

Le fichier de configuration `$KUBECONFIG=$HOME/.kube/config` encapsule les caractéristiques de la grappe, les certificats :closed_lock_with_key: correspondants, les clés privés :key: ainsi que les informations sur l'administrateur. 

## :o2: Fichier de configuration

:round_pushpin: Copier le fichier :ice_cube: `kube` config sur son PC

- [ ] s'assurer d'avoir une connexion privilégiée avec une clé privée `~/.ssh/myprivate-key.pk` ayant accès au plan de contrôle.

- [ ] Fournir le nom de domaine du plan de contrôle i.e. `ubuntu@betelgeuse.boreal.codes`

```
$ mkdir -p $HOME/.kube
$ scp -i ~/.ssh/myprivate-key.pk ubuntu@betelgeuse.boreal.codes:.kube/config ~/.kube/config
$ export KUBECONFIG=$HOME/.kube/config
```

- [ ] Visualisation des contexts de connexion aux grappes `Kubernetes`

```
$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```

La grappe `kubernetes`, ayant comme nom de contexte `kubernetes-admin@kubernetes` est affichée

- [ ] Renommer le nom de contexte par défaut `kubernetes-admin@kubernetes` à celui du nom de contexte voulu

Par exemple de `kubernetes-admin@kubernetes` à `kubernetes-admin@orion`

```
$ kubectl config rename-context kubernetes-admin@kubernetes kubenetes-admin@orion
Context "kubernetes-admin@kubernetes" renamed to "kubenetes-admin@orion".
```

- [ ] Vérifier le chandement de nom de contexte

```
$ kubectl config get-contexts                                                      
CURRENT   NAME                      CLUSTER      AUTHINFO           NAMESPACE
*         kubenetes-admin@orion     kubernetes   kubernetes-admin   
```

- [ ] Renommer le nom de grappe par défaut `kubernetes` à celui du nom de grappe voulu

Par exemple de `kubernetes` à `orion`

```
$ kubectl config set contexts.kubenetes-admin@orion.cluster orion 
```

- [ ] Vérifier le chandement de nom de grappe

```
$ kubectl config get-contexts                                        
CURRENT   NAME                      CLUSTER      AUTHINFO           NAMESPACE
*         kubenetes-admin@orion     orion        kubernetes-admin   
```

## :cl: Sauvegarde du contexte

Sauvegarder le fichier de configuration de contexte sur github dans votre nom de grappe.

- [ ] Créer un répertoire `.kube` sous votre grappe dans le projet

```
$ mkdir <LE NOM DE MA GRAPPE>/.kube
$ cp ~/.kube/config <LE NOM DE MA GRAPPE>/.kube
```

- [ ] Sauver dans github

```
$ git add et tralala
```


# References

https://faun.pub/using-different-kubectl-versions-with-multiple-kubernetes-clusters-a3ad8707b87b
