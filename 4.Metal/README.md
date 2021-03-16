# Metal

L'exercice dans cette section est de préparer sa grappe (cluster) que vous installerez sur du métal.

## :x: Réorganisation

Pour faciliter l'organisation en grappes, il faut d'abord assembler les addresses IP

- [ ] Réorganiser [Reorg](.doc/Reorg.md) :pinching_hand: les addresses IP dans le sous-réseau `10.13.237.0/24`


## :a: Nommage

Votre grappe comprend 4 noeuds (serveurs) que vous devrez d'abord nommer

- [ ] Nommer vos [Grappes](.doc/Grappes.md) :pinching_hand: 

:star: Name: :grey_question:

| Type Server   | Hostname                |  IP               | Specs                 |
|---------------|-------------------------|-------------------|-----------------------|
| control plane | betelgeuse.boreal.codes | `10.13.15.200/20` | 64GB Ram,      16cpus |
| data plane    | bellatrix.boreal.codes  | `10.13.15.201/20` | 64GB Ram,      16cpus |
| data plane    | rigel.boreal.codes      | `10.13.15.202/20` | 32GB Ram,      16cpus |
| data plane    | saiph.boreal.codes      | `10.13.15.203/20` | 64GB Ram,      16cpus |
