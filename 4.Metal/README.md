# Metal

L'exercice dans cette section est de préparer sa grappe (cluster) que vous installerez sur du métal.

## :x: Réorganisation

Pour faciliter l'organisation en grappes, il faut d'abord assembler les addresses IP

- [ ] Réorganiser [Reorg](.doc/Reorg.md) :writing_hand:	 les addresses IP dans le sous-réseau `10.13.237.0/24`


## :a: Nommage

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

## :b: La préparation

:round_pushpin: Les disques

Le but de l'exercice est de créer des disques (CR Custom Resources pour Kubernetes)

- [ ] `ubuntu--vg-iscsi--lv`
- [ ] `ubuntu--vg-docker--lv`

[LVM](https://github.com/CollegeBoreal/Tutoriels/tree/main/O.OS/1.Linux/L.LVM) :writing_hand:	

:round_pushpin: Le serveur

- [ ] son nom
- [ ] son `swap`
- [ ] son `bridge`

[Preparation](.doc/Preparation.md) :writing_hand:	

## :ab: Les composants

<img src="images/kube-cluster-component-topology.png" width="708" height="348"></img>
