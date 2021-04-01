# Kube Tools

## :gear: Version de Kubernetes

- [ ] S'assurer de donner le bon nom à votre serveur hôte (basé sur la topologie de la grappe)

```
$ hostnamectl --static set-hostname "DONNER UN NOM AU SERVEUR"
```

- [ ] Installer une version spécifique de Kubernetes

```
$ export KUBEVERSION=1.18.6
``` 

## :zero: Preparer le serveur

Mettre le serveur à jour et le redémarrer.

:warning: Attention, le serveur va `reboot`er

```
$ sudo apt update && sudo apt -y upgrade && sudo systemctl reboot
```

## :one: Installer en utilisant le [référentiel](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

:round_pushpin: Installe `curl`, `apt-transport-https` et autres outils utilisé pour télécharger les librairies (Package Manager)

:bulb: Certains référentiels ont des `URL` utilisant `HTTPS`. La librairie `apt-transport-https` doit être installée pour acceder le lien `HTTPS`:

```
$ sudo apt update && sudo apt -y install curl apt-transport-https ca-certificates gnupg-agent software-properties-common
```

## :two: Installer kubelet, kubeadm and kubectl

:bulb: Quels outils :ice_cube: kube doit ont installer? 

| Outil   | Utilisation                                                      |
|---------|------------------------------------------------------------------|
| kubeadm | Outil créé pour fournir **kubeadm** `init` et **kubeadm** `join` |
| kubectl | Outil de ligne de commande Kubernetes                            |

:round_pushpin: Adding the `kubernetes` package repository to the package manager registry  

- [ ] Add the Google official `pgp` key :key: that will go to the `/etc/apt/trusted.gpg` binary file

* add the PGP key

```
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```

* Verify that you now have the key with the fingerprint `54A6 47F9 048D 5688 D7DA  2ABE 6A03 0B21 BA07 F4FB`, by searching for the last 8 characters of the fingerprint.

```
$ sudo apt-key fingerprint BA07F4FB
pub   rsa2048 2018-04-01 [SCE] [expires: 2021-03-31]
      54A6 47F9 048D 5688 D7DA  2ABE 6A03 0B21 BA07 F4FB
uid           [ unknown] Google Cloud Packages Automatic Signing Key <gc-team@google.com>
```

- [ ] Create the kubernetes debian repository file

:warning: as of 2021 `xenial` (a.k.a yakkety) is still the latest version check `https://packages.cloud.google.com/apt/dists` 

```
$ echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

:round_pushpin: Install the :ice_cube: `kube` tools

```
$ sudo apt update && sudo apt install -y kubeadm=${KUBEVERSION}-00 kubelet=${KUBEVERSION}-00 kubectl=${KUBEVERSION}-00
```

:round_pushpin: Prevent the :ice_cube: `kube`  tools from being altered (optional)

```
$ sudo apt-mark hold kubeadm kubectl
```

:+1: Test that the :ice_cube: `kube` tools are installed

```
$ OUT="--output=json"; kubeadm version ${OUT} && kubectl version --client ${OUT}
```
