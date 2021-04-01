#  :droplet: kubelet

| Service | Utilisation                                                   |
|---------|--------------------------------------------------------------------------------------------------------------------------|
| kubelet | Responsable de maintainir un ensemble de `pods`, qui sont composés d'un ou de plusieurs conteneurs, dans un système local |

## :zero: Installer la librairie

:bulb: S'assurer que le référentiel des librairies `kubernetes` a été installé précédemment (voir [Installation des outils kubernetes](.docs/kube-tools.md#one-installer-le-référentiel-google-cloud))

:round_pushpin: Installer la librarie du service `kubelet`

- [ ] Choisir une version spécifique de Kubernetes

```
$ export KUBEVERSION=1.18.6
``` 

- [ ] Commencer l'installation

```
$ sudo apt update && sudo apt -y install kubelet=${KUBEVERSION}-00
```

:round_pushpin:  Prévenir l'altération (mise à jour) du service :droplet: kubelet

```
$ sudo apt-mark hold kubelet
```


## :gear: Où est le fichier de service `kubelet` [drop-in file](https://stackoverflow.com/questions/59842743/what-is-a-drop-in-file-what-is-a-drop-in-directory-how-to-edit-systemd-service) (i.e. fichier systemd .conf)

```
$ sudo cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
```

## :one: Tout de suite après l'installation du service

:+1: Tester que le service `kubelet` est chargé **(loaded)**

```
$ systemctl status kubelet
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
    Drop-In: /etc/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: activating (auto-restart) (Result: exit-code) since Sun 2021-02-14 11:30:15 UTC; 2s ago
       Docs: https://kubernetes.io/docs/home/
    Process: 315103 ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EX>
   Main PID: 315103 (code=exited, status=255/EXCEPTION)
```

## :two: Démarrer le :droplet: service `kubelet`

``` 
$ sudo systemctl enable kubelet && sudo systemctl start kubelet
```

# Références

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/kubelet-integration/
