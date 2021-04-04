



- [ ] Visualisation des contexts de connexion aux grappes `Kubernetes`

```
$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```

La grappe `kubernetes`, ayant comme nom de contexte `kubernetes-admin@kubernetes` est affichée

- [ ] Renommer le nom de contexte par défaut `kubernetes-admin@kubernetes` à celui du nom de contexte voulu

Par exemple de `kubernetes-admin@kubernetes` à `kubernetes-admin@ontario`

```
$ kubectl config rename-context kubernetes-admin@kubernetes kubenetes-admin@ontario
Context "kubernetes-admin@kubernetes" renamed to "kubenetes-admin@ontario".
```

- [ ] Vérifier le chandement de nom de contexte

```
$ kubectl config get-contexts                                                      
CURRENT   NAME                      CLUSTER      AUTHINFO           NAMESPACE
*         kubenetes-admin@ontario   kubernetes   kubernetes-admin   
```

- [ ] Renommer le nom de grappe par défaut `kubernetes` à celui du nom de grappe voulu

Par exemple de `kubernetes` à `ontario`

```
$ kubectl config set contexts.kubenetes-admin@ontario.cluster ontario 
```

- [ ] Vérifier le chandement de nom de grappe

```
$ kubectl config get-contexts                                        
CURRENT   NAME                      CLUSTER      AUTHINFO           NAMESPACE
*         kubenetes-admin@ontario   ontario      kubernetes-admin   
```

