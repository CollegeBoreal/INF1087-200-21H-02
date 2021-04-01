# Kube Tools

Sur chacun des serveurs, installer les outils suivants

## :zero: Preparer le serveur

Mettre le serveur à jour et le redémarrer.

:warning: Attention, le serveur va `reboot`er

```
$ sudo apt update && sudo apt -y upgrade && sudo systemctl reboot
```

## :one: Installer le [référentiel](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) `google cloud`

:round_pushpin: Installe `curl`, `apt-transport-https` et autres outils utilisé pour télécharger les librairies (Package Manager)

:bulb: Certains référentiels ont des `URL` utilisant `HTTPS`. La librairie `apt-transport-https` doit être installée pour acceder le lien `HTTPS`:

```
$ sudo apt update && sudo apt -y install curl apt-transport-https ca-certificates gnupg-agent software-properties-common
```

:round_pushpin: Ajout du référentiel de librairies `kubernetes` au référentiel de gestionnaire de libraries  

- [ ] Ajout de la clé officielle `pgp` :key: de `google cloud` qui sera placé dan le fichier binaire `/etc/apt/trusted.gpg`

* Ajouter la clé `PGP`

```
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```

* Vérifier que l'empreinte de la clé `54A6 47F9 048D 5688 D7DA  2ABE 6A03 0B21 BA07 F4FB` est bien capturée en la cherchant avec les 8 derniers caractères de l'empreinte.

```
$ sudo apt-key fingerprint BA07F4FB
pub   rsa2048 2018-04-01 [SCE] [expires: 2021-03-31]
      54A6 47F9 048D 5688 D7DA  2ABE 6A03 0B21 BA07 F4FB
uid           [ unknown] Google Cloud Packages Automatic Signing Key <gc-team@google.com>
```

- [ ] Ajouter le fichier `kubernetes debian` au référentiel

```
$ echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

## :two: Installer **kubeadm** and **kubectl**

:bulb: Quels outils :ice_cube: kube doit on installer? 

| Outil   | Utilisation                                                      |
|---------|------------------------------------------------------------------|
| kubeadm | Outil créé pour fournir **kubeadm** `init` et **kubeadm** `join` |
| kubectl | Outil de ligne de commande Kubernetes                            |

:round_pushpin: Installer les outils :ice_cube: `kube`

- [ ] Choisir une version spécifique de Kubernetes

```
$ export KUBEVERSION=1.18.6
``` 

- [ ] Installer la version spécifique de Kubernetes

```
$ sudo apt update && sudo apt install -y kubeadm=${KUBEVERSION}-00 kubectl=${KUBEVERSION}-00
```

:round_pushpin: Prévenir l'altération (mise à jour) des outils :ice_cube: `kube`

```
$ sudo apt-mark hold kubeadm kubectl
```

:+1: Tester que les outils :ice_cube: `kube` sont installés

```
$ OUT="--output=json"; kubeadm version ${OUT} && kubectl version --client ${OUT}
```

[:back:](../../)
