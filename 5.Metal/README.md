# :wheel_of_dharma: Kubernetes sur Métal

L'exercice dans cette section est de préparer sa grappe (cluster) que vous installerez sur du métal.

:tada: [Participation](.scripts/Participation.md)

:x: [Réorganisation](.doc/Reorg.md) :writing_hand:	préalable des addresses IP sous le sous-réseau `10.13.237.0/24`

## :book: Table des matières

| Chapitres                               | Descriptions                                                       |
|-----------------------------------------|--------------------------------------------------------------------|
| [:o2: Nommage](#o2-nommage)               | Constituer et nommer sa grappe                                     |
| [:a: La préparation](#a-la-préparation) | Préparer son noeud                                                 |
| [:b: Les composants](#b-les-composants) | Installer les composants constituant la grappe (outils et services)|
| [:ab: Les plans](#ab-les-plans)                                                         | Déployer les plans `kubernetes` de contrôle et de données          |
| [:joystick: Contrôller la grappe](#joystick-contrôller-la-grappe-à-distance) |  Contrôller la grappe à distance d'un poste d'utilisateur |
| [:floppy_disk: Le stockage ](#floppy_disk-le-stockage) | Stocker les données sur des disques synchronisés sur un réseau de stockage (SAN) |
| [:rocket: Les services](#rocket-les-services) | Permet de fournir les applications à travers des services |


## :o2: Nommage

:busts_in_silhouette: activité en groupe

Votre grappe comprend 4 noeuds (serveurs) que vous devrez d'abord nommer

- [ ] Nommer vos [Grappes](.doc/Grappes.md) :writing_hand:	 
- [ ] Après avoir déterminé le nom de votre grappe:

* Créer un répertoire avec le nom de votre grappe et y mettre un fichier `README.md` avec la topologie de votre grappe, example:

:star: Name: orion

| Type Server   | Hostname                |  IP               | Specs                 |
|---------------|-------------------------|-------------------|-----------------------|
| control plane | betelgeuse.boreal.codes | `10.13.15.200/20` | 64GB Ram,      16cpus |
| data plane    | bellatrix.boreal.codes  | `10.13.15.201/20` | 64GB Ram,      16cpus |
| data plane    | rigel.boreal.codes      | `10.13.15.202/20` | 32GB Ram,      16cpus |
| data plane    | saiph.boreal.codes      | `10.13.15.203/20` | 64GB Ram,      16cpus |

## :a: La préparation

:bust_in_silhouette: activité individuelle

#### :round_pushpin: Le serveur

- [ ] son nom
- [ ] son `swap`
- [ ] son `bridge`

[Preparation](.doc/Preparation.md) :writing_hand:	


## :b: Les composants

:bust_in_silhouette: activité individuelle

<img src="images/kube-cluster-component-topology.png" width="708" height="388"></img>

#### :round_pushpin: Installation des outils

- [ ] Installer les outils [:ice_cube: kubetools](.doc/kube-tools.md) :writing_hand: permettant de gérer la grappe, comme `kubeadm` et `kubectl`

#### :round_pushpin: Installation des services

- [ ] Installer le [CNI](https://kubernetes.io/docs/concepts/cluster-administration/networking/) géré par le Service [:droplet: Kubelet](.doc/kubelet.md) :writing_hand:	 

- [ ] Installer le [CRI](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) géré par le Service [:whale: Docker](.doc/docker.md) :writing_hand:	 défini par l'[OCI](https://opencontainers.org) ( :bulb: __À installer uniquement si Docker n'est pas déjà sur le serveur__ )

## :ab: Les plans

:busts_in_silhouette: activité en groupe

##### :control_knobs: Le plan de contrôle (control plane)

:warning: Assurez vous que votre domaine a tous les noms de serveurs (noeuds) liés à votre grappe

- [ ] Installer le [plan de contrôle](.doc/control-plane.md) :writing_hand:	 
- [ ] Initialiser le réseau de gousses (pod network) en utilisant le [CNI plugin](.doc/cni-plugin.md) :writing_hand: Calico

##### :abacus: Les plan de données (data plane)

- [ ] Permettre aux autres noeux de [joindre](.doc/data-plane.md) :writing_hand: la grappe.


## :joystick: Contrôller la grappe

:round_pushpin: Copier le fichier :ice_cube: `kube` config sur son PC

- [ ] s'assurer d'avoir une connexion privilégiée avec une clé privée `~/.ssh/myprivate-key.pk`

- [ ] Fournir le nom de domaine du plan de contrôle i.e. `ubuntu@betelgeuse.boreal.codes`

```
$ mkdir -p $HOME/.kube
$ scp -i ~/.ssh/myprivate-key.pk ubuntu@betelgeuse.boreal.codes:.kube/config ~/.kube/config
$ export KUBECONFIG=$HOME/.kube/config
```

:round_pushpin: Installer les [:toolbox: outils](.doc/kube-tools-pc.md) :writing_hand: pour gérer sa grappe

| outil     | Description          |
|-----------|----------------------|
| `kubectl` | Contrôller la grappe |
| `helm`    | Gestionnaire de librairies (Package Manager) de Kubernetes |
| `lens`    | IDE permettant la gestion de Kubernetes |

:round_pushpin:  Tester sa connexion à la grappe

```
$ kubectl config get-contexts                                                      
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```

## :floppy_disk: Le stockage

Le but de l'exercice est de créer un disque ou plutôt un volume logique et de le mettre en réseau avec `iSCSI`

- [ ] Créer le volume logique [:cd: lvm](.doc/lvm.md) :writing_hand:	appellé `iscsi-lv` 
- [ ] Installer le Service [:minidisc: iSCSI](.doc/iscsi.md) :writing_hand:	d'[`open-iscsi`](http://www.open-iscsi.com/)

- [ ] Installer le [CSI](https://kubernetes-csi.github.io) géré par [OpenEBS](https://openebs.io) `Elastic Block Storage`

## :rocket: Les Services
