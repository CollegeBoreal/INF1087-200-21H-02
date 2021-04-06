# Porter

https://porterlb.io/docs/getting-started/usage/use-porter-in-layer-2-mode/

## :o2: [Installer Porter](https://porterlb.io/docs/getting-started/installation/install-porter-on-kubernetes/#install-porter-using-kubectl)

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


## :round_pushpin: Permettre strictARP à kube-proxy

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

## :round_pushpin: Spécifiez la carte réseau à utiliser pour Porter

Si le nœud sur lequel Porter est installé a plusieurs «NIC», vous devez spécifier le «NIC» utilisé pour Porter en mode «Layer 2». Vous pouvez ignorer cette étape si le nœud n'a qu'un seul «NIC».

Exécuter la commande suivante sur :control_knobs: le plan de contrôle pour annoter le `NIC` à une adresse IP spécifique:

- [ ] remplacer `betelgeuse` par le nom du serveur de votre plan de contrôle
- [ ] remplacer l'adress IP `10.13.237.10` par l'adresse du serveur de votre plan de contrôle

```
$ kubectl annotate nodes betelgeuse \
          layer2.porter.kubesphere.io/v1alpha1="10.13.237.10"
```


## :round_pushpin: Créer l'objet EIP (External IP) 

L'objet `Eip` functionne comme un réservoir d'adresse IP pour Porter.

Exécutez la commande suivante pour créer un fichier YAML pour l '«objet Eip»:

- [ ] Récupérer le nom de l'interface "NIC" (i.e. `enp3s0f0`)

```
$ ip addr | grep 10.13.237
    inet 10.13.237.14/24 brd 10.13.237.255 scope global enp3s0f0
```

- [ ] modifiez les informations du réservoir d'IP dans le champ `{spec.address}` (i.e. `10.13.237.8-10.13.237.11`) séparé par un `-` 
- [ ] modifiez les informations du réservoir d'IP dans le champ `{spec.interface}` (i.e. `enp3s0f0`)



```yaml
$ kubectl apply --filename - <<EOF
apiVersion: network.kubesphere.io/v1alpha2
kind: Eip
metadata:
  name: porter-layer2-eip
spec:
  address: 10.13.237.8-10.13.237.11
  interface: enp3s0f0
  protocol: layer2
EOF
```
