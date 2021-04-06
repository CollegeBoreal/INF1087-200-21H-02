# Porter

https://porterlb.io/docs/getting-started/usage/use-porter-in-layer-2-mode/

## :zero: [Installer Porter](https://porterlb.io/docs/getting-started/installation/install-porter-on-kubernetes/#install-porter-using-kubectl)

```
$ kubectl apply --filename https://raw.githubusercontent.com/kubesphere/porter/master/deploy/porter.yaml
```

- [ ] Vérifier que porter est installé

```
$ kubectl get pods --namespace porter-system  
NAME                             READY   STATUS      RESTARTS   AGE
porter-admission-create-2tdnp    0/1     Completed   0          8m7s
porter-admission-patch-vlnjg     0/1     Completed   2          8m7s
porter-manager-6d78f6fb7-kpl2k   1/1     Running     0          8m7s
```


## :one: Permettre strictARP à kube-proxy

En mode Couche 2, vous devez activer `strictARP` pour `kube-proxy` afin que toutes les cartes réseaux de la grappe Kubernetes cessent de répondre aux requêtes `ARP` des autres cartes réseaux et que Porter gère les requêtes `ARP` à la place.

- [ ] Exécuter la commande suivante pour modifier le `kube-proxy ConfigMap`:

```
$ kubectl edit configmap kube-proxy --namespace kube-system
```

- [ ] Dans la configuration `kube-proxy ConfigMap YAML`, mettre `data.config.conf.ipvs.strictARP` à `true`.

```yaml
ipvs:
  strictARP: true
```

- [ ] Exécutez la commande suivante pour redémarrer `kube-proxy`:

```
$ kubectl rollout restart daemonset kube-proxy --namespace kube-system
```

```
$ ip addr | grep 10.13.237
    inet 10.13.237.14/24 brd 10.13.237.255 scope global enp3s0f0
```
