# OpenEBS



## :o2: Installation



```
$ helm repo add openebs https://openebs.github.io/charts
```

```
$ helm repo update
```


```
$ kubectl create namespace openebs
namespace/openebs created
```

- [ ] Installer `openebs` avec le gestionnaire de librairie :package: helm

```
$ helm install openebs openebs/openebs --namespace openebs
```

- [ ] Vérifier l'installation

```
$ helm ls --namespace openebs
NAME   	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART        	APP VERSION
openebs	openebs  	1       	2021-04-04 11:25:42.579325 -0400 EDT	deployed	openebs-2.7.0	2.7.0   
```
