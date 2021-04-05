# :roll_of_paper: Le périphérique en mode bloc (Block Device)

Les périphériques en mode bloc réferent souvant aux disques durs dont la lecture se fait en bloc, généralement de 512 octets (bytes)

## :ab: Information sur le périphérique 

`Udev` est le gestionnaire de périphérique du noyau `Linux`. Dynamiquement, Udev crée ou enlève des noeuds de fichiers périphériques au démarrage en fonction du répertoire `/dev` pour tous types de périphériques. `Udev` fait maintenant partie de `systemd` et peut être controllé par `$ systemctl status systemd-udevd`.

- [ ] Pour avoir des informations sur un périphérique: (i.e `/dev/ubuntu-vg/iscsi-lv`)

```
$ udevadm info --query property --name /dev/ubuntu-vg/iscsi-lv
DEVPATH=/devices/virtual/block/dm-1
DEVNAME=/dev/dm-1
DEVTYPE=disk
MAJOR=253
MINOR=1
SUBSYSTEM=block
USEC_INITIALIZED=8756642703164
DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG=1
DM_UDEV_PRIMARY_SOURCE_FLAG=1
DM_UDEV_RULES=1
DM_UDEV_RULES_VSN=2
DM_NAME=ubuntu--vg-iscsi--lv
DM_UUID=LVM-HKIv7LZ8lAU2TLmwaLrT0eCuRQwJJ9efoV0aa0SfTVZwDsctMoF6dfv9xlyxv115
DM_SUSPENDED=0
DM_VG_NAME=ubuntu-vg
DM_LV_NAME=iscsi-lv
DM_TABLE_STATE=LIVE
DM_STATE=ACTIVE
DEVLINKS=/dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv /dev/mapper/ubuntu--vg-iscsi--lv /dev/disk/by-id/dm-uuid-LVM-HKIv7LZ8lAU2TLmwaLrT0eCuRQwJJ9efoV0aa0SfTVZwDsctMoF6dfv9xlyxv115 /dev/ubuntu-vg/iscsi-lv
TAGS=:systemd:
```

- [ ] pour avoir la taille d'un périphérique

```
$ sudo fdisk --list /dev/mapper/ubuntu--vg-iscsi--lv
Disk /dev/mapper/ubuntu--vg-iscsi--lv: 100 GiB, 107374182400 bytes, 209715200 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

- [ ] pour avoir son :id: ou encore son **PARTUUID**

```
$ echo "blockdevice-"`sudo blkid --match-tag PARTUUID --output value /dev/sda3`
blockdevice-943643da-1a54-4b2f-b1fa-e1c27ba61b96
```

- [ ] pour enfin avoir le nom du noeud

```
$ uname --nodename
brooks
```

:building_construction: Ces informations sont requises pour créer le fichier de configuration `yaml` utilisé pour créer le périphérique en mode bloc `block device`. 3 périphériques `(block devices)` sont requis pour former un réservoir `(pool)` de stockage géré par un réseau `iSCSI`

| TAG | Valeur |
|--------------------------------------------|------------------------------------|
| `{metadata.name}`                          | blockdevice-**PARTUUID**           |
| `{metadata.labels.kubernetes.io/hostname}` | **uname --nodename**               |
| `{spec.capacity.storage}`                  | **fdisk --list (taille en bytes)** |
| `{spec.devlinks.kind[by-id].links}`        | **udevadm info** - DEVLINKS /dev/disk/**by-id(1)**  |
|                                            | **udevadm info**- DEVLINKS /dev/disk/**by-id(2)**  |
| `{spec.devlinks.kind[by-path].links}`      | **udevadm info**- DEVLINKS /dev/**mapper(1)**      |
| `{spec.nodeAttributes.nodeName]`           | **uname --nodename**               |
| `{spec.path}`                              | **udevadm info**- DEVNAME |

:star: Le fichier se présente comme ceci:

```yaml
$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-18918f5d-e3d0-4e77-9126-febbfbf0366c
   labels:
     kubernetes.io/hostname: brooks
     ndm.io/managed: "false"
     ndm.io/blockdevice-type: blockdevice
 status:
   claimState: Unclaimed
   state: Active
 spec:
   capacity:
     logicalSectorSize: 512
     storage: 107374182400
   details:
     deviceType: lvm
   devlinks:
   - kind: by-id
     links:
     - /dev/disk/by-id/dm-uuid-LVM-HKIv7LZ8lAU2TLmwaLrT0eCuRQwJJ9efoV0aa0SfTVZwDsctMoF6dfv9xlyxv115
     - /dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv
   - kind: by-path
     links:
     - /dev/mapper/ubuntu--vg-iscsi--lv
   nodeAttributes:
     nodeName: brooks
   path: /dev/dm-1
---
EOF
```

# :b: Créer le fichier `blockdevice`:

:round_pushpin: Créer un fichier par noeud et le mettre dans le répertoire de la grappe en suivant le modèle ci-dessous:

- [ ] Le nom du fichier devra être sous la forme `blockdevice-xxxx-xxxx-xxx-xxx.md`

- [ ] Il sera de type `yaml` et commencera par la commande `kubectl` comme ceci:
  >  kubectl apply --namespace openebs --filename - <<EOF 

- [ ] Il se terminera avec le commentaire `yaml` `---` et le mot:
  > ---
  > EOF

:warning: Bien vérifier que le fichier aient les bonnes informations du périphérique `iscsi-lv`

[:back:](../#roll_of_paper-le-périphérique-block-device)


# References

https://help.mayadata.io/hc/en-us/articles/360033465571-BlockDevice-CR-creation-for-partitioned-disks

https://openebs.io/blog/creating-manual-blockdevice/

```yaml
apiVersion: openebs.io/v1alpha1
kind: BlockDevice
metadata:
  name: example-blockdevice
  labels:
    kubernetes.io/hostname: <host name in which disk/blockdevice is attached> # like gke-openebs-user-default-pool-044afcb8-bmc0
    ndm.io/managed: "false" # for manual disk creation put false
    ndm.io/blockdevice-type: blockdevice
status:
  claimState: Unclaimed
  state: Active
spec:
  capacity:
    logicalSectorSize: <logical sector size of lockdevice> # like 512
    storage: <total capacity in bytes> #like 53687091200
  details:
    firmwareRevision: <firmware revision>
    model: <model name of blockdevice> # like PersistentDisk
    serial: <serial no of disk> # like google-disk-2
    compliance: <compliance of disk> #like "SPC-4"
    vendor: <vendor of disk> #like Google
  devlinks:
  - kind: by-id
    links:
    - <link1> # like /dev/disk/by-id/scsi-0Google_PersistentDisk_disk-2
    - <link2> # like /dev/disk/by-id/google-disk-2
  - kind: by-path
    links:
    - <link1> # like /dev/disk/by-path/virtio-pci-0000:00:03.0-scsi-0:0:2:0 
  Partitioned: Yes
  path: <devpath> # like /dev/sdb1
```
# References

https://www.thegeekdiary.com/beginners-guide-to-udev-in-linux/
