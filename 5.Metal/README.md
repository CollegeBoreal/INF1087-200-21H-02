# :wheel_of_dharma: Kubernetes sur Métal

L'exercice dans cette section est de préparer sa grappe (cluster) que vous installerez sur du métal.

| :tada: Participation                                             |  Commentaires        |
|------------------------------------------------------------------|----------|
| [ :bust_in_silhouette: Individuelle ](.scripts/Participation.md) |          |
| [ :busts_in_silhouette: En groupe ](.scripts/Groupes.md)         |          |

:x: [Réorganisation](.doc/Reorg.md) :writing_hand:	préalable des addresses IP sous le sous-réseau `10.13.237.0/24`

## :book: Table des matières

| Chapitres                               | Descriptions                                                       |
|-----------------------------------------|--------------------------------------------------------------------|
| [:o2: Nommage](#o2-nommage)               | Constituer et nommer sa grappe                                     |
| [:a: La préparation](#a-la-préparation) | Préparer son noeud                                                 |
| [:b: Les composants](#b-les-composants) | Installer les composants constituant la grappe (outils et services)|
| [:ab: Les plans](#ab-les-plans)                                   | Déployer les plans `kubernetes` de contrôle et de données          |
| [:joystick: Contrôller la grappe](#joystick-contrôller-la-grappe) |  Contrôller la grappe à distance d'un poste d'utilisateur |
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

:busts_in_silhouette: activité en groupe

:round_pushpin: Installer les [:toolbox: outils](.doc/kube-tools-pc.md) :writing_hand: sur son PC pour gérer la grappe

| outil     | Description          |
|-----------|----------------------|
| `kubectl` | Contrôller la grappe |
| :package: `helm`    | Gestionnaire de librairies (Package Manager) de Kubernetes |
| :level_slider: `lens`    | IDE permettant la gestion de Kubernetes |

:round_pushpin:  Mettre le fichier de `configuration` en contexte pour permettre la gestion de la grappe à distance

- [ ] Installer le fichier de configuration dans un [contexte](.doc/contexts.md) :writing_hand:	 `Kubernetes`

:round_pushpin:  Tester sa connexion à la grappe

- [ ] Vérifier que le context courrant pointe bien sur `kubernetes-admin@orion`

```
$ kubectl config get-contexts                                                      
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```

- [ ] Vérifier que la grappe est complète

```
$ kubectl get nodes
NAME         STATUS   ROLES    AGE     VERSION
bellatrix    Ready    <none>   3m15s   v1.18.6
betelgeuse   Ready    master   25m     v1.18.6
rigel        Ready    <none>   68s     v1.18.6
saiph        Ready    <none>   22s     v1.18.6
```

- [ ] Visualiser la grappe dans :level_slider: `Lens`

:warning: Attention à ne pas installer d'applications, il manque la partie stockage.

## :cl: La classe de stockage (Storage Class)

#### :roll_of_paper: Le périphérique (Block Device)

:bust_in_silhouette: activité individuelle à appliquer à partir du :abacus: des plans de données: 

Le but de l'exercice est de créer un disque ou plutôt un volume logique et de le mettre en réseau avec `iSCSI`


- [ ] Installer le Service [:minidisc: iSCSI](.doc/iscsi.md) :writing_hand:	d'[`open-iscsi`](http://www.open-iscsi.com/)
- [ ] Créer le volume logique [:cd: lvm](.doc/lvm.md) :writing_hand:	appellé `iscsi-lv`
- [ ] Préparer le [périphérique](.doc/blockdevice.md) en mode block et l'enregistrer dans un fichier `blockdevice-xxxx-xxx-xxx.md` du répertoire de votre grappe.

#### :floppy_disk: Le stockage (Container Storage)

:busts_in_silhouette: activité en groupe à appliquer à partir du :control_knobs: plan de contrôle: 

<img src="images/1-config-sequence.svg" width="657" height="145"> </img>

- [ ]  [Installer](.doc/openebs-install.md):pinching_hand: [openEBS](https://openebs.io). C'est une [Police](https://kubernetes-csi.github.io/docs/drivers.html) [CSI](https://kubernetes-csi.github.io/docs/) permettant une implémentation [SAN](https://en.wikipedia.org/wiki/Storage_area_network) du protocole [iSCSI](https://en.wikipedia.org/wiki/ISCSI) 

- [ ] Appliquer les operations liées à l'administrateur de la grappe 

- [ ] Appliquer les operations liées à l'utilisateur de la grappe

Installer la [Police](https://kubernetes-csi.github.io/docs/drivers.html) de [CSI](https://kubernetes-csi.github.io) (Interface de Stockage de Conteneur) géré par [OpenEBS](.doc/openebs) :writing_hand: `Elastic Block Storage`

## :rocket: Les Services
