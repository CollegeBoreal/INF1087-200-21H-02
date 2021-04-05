# OpenEBS - Operations d'administration

:control_knobs: Sur le plan de contrôle

https://docs.openebs.io/docs/next/ugcstor.html#admin-operations

## :a: Les Périphériques en mode bloc - BlockDevice CR (Custom Resource)


- [ ] Créer les périphériques :roll_of_paper:

> Éxécuter les commandes `kubectl` se reférant aux fichiers `blockdevice-****-****-****-****.md`

:bulb: Il devrait y avoir :three: fichiers à éxécuter


- [ ] Vérifier la création des périphériques

> blockdevices or bd

```
% kubectl get blockdevices --namespace openebs   
NAME                                               NODENAME    SIZE        CLAIMSTATE   STATUS   AGE
blockdevice-23e1292d-32f5-4528-8f7f-3abaee070a03   bellatrix   102687672   Unclaimed    Active   15s
blockdevice-3fa7d473-d0f1-4532-bcd4-a402241eeff1   saiph       102687672   Unclaimed    Active   15s
blockdevice-7e848c90-cca2-4ef4-9fdc-90cff05d5bb5   rigel       102687672   Unclaimed    Active   15s
```

> blockdeviceclaims or bdc

```
$ kubectl get blockdeviceclaims.openebs.io --namespace openebs
NAME                                       BLOCKDEVICENAME                                    PHASE   AGE
bdc-0fcbd750-d9bc-484c-bc4b-d3b800bf5425   blockdevice-3fa7d473-d0f1-4532-bcd4-a402241eeff1   Bound   17h
bdc-562edaf1-6aef-485b-b83f-a7ddd73efcd3   blockdevice-23e1292d-32f5-4528-8f7f-3abaee070a03   Bound   17h
bdc-a68503ba-9882-459d-9e36-da24c54e1977   blockdevice-7e848c90-cca2-4ef4-9fdc-90cff05d5bb5   Bound   17h
```

## :b: Le réservoir de stockage - Storage Pool

:round_pushpin: Créer le réservoir de stockage `cstor` `cStor Storage Pool` (csp)

- [ ] modifier le fichier de configuration ci-dessous en changeant les périphériques `block device`

```yaml
$ kubectl apply -f - <<EOF
#Use the following YAMLs to create a cStor Storage Pool.
apiVersion: openebs.io/v1alpha1
kind: StoragePoolClaim
metadata:
  name: cstor-disk-pool
  annotations:
    cas.openebs.io/config: |
      - name: PoolResourceRequests
        value: |-
            memory: 2Gi
      - name: PoolResourceLimits
        value: |-
            memory: 4Gi
spec:
  name: cstor-disk-pool
  type: disk
  poolSpec:
    poolType: striped
  blockDevices:
    blockDeviceList:
    - blockdevice-23e1292d-32f5-4528-8f7f-3abaee070a03 # ME CHANGER VITE
    - blockdevice-3fa7d473-d0f1-4532-bcd4-a402241eeff1 # ME CHANGER VITE
    - blockdevice-7e848c90-cca2-4ef4-9fdc-90cff05d5bb5 # ME CHANGER VITE
---
EOF
```

:round_pushpin: Sauveguarder le fichier `StoragePoolClaim.md`

- [ ] après avoir modifier les périphériques sauvegarder sous le nom `StoragePoolClaim.md` dans le répertoire de votre grappe

- [ ] Exécuter la commande `kubectl` à partir du fichier.

:round_pushpin: Vérifier que les périphériques passent à l'état `claimed` - Contesté

```
$ kubectl get blockdevices --namespace openebs
NAME                                               NODENAME    SIZE        CLAIMSTATE   STATUS   AGE
blockdevice-23e1292d-32f5-4528-8f7f-3abaee070a03   bellatrix   102687672   Claimed      Active   16m
blockdevice-3fa7d473-d0f1-4532-bcd4-a402241eeff1   saiph       102687672   Claimed      Active   16m
blockdevice-7e848c90-cca2-4ef4-9fdc-90cff05d5bb5   rigel       102687672   Claimed      Active   16m
```

## :ab: [Classe de Stockage](https://kubernetes.io/docs/concepts/storage/storage-classes/)

:round_pushpin: Créer la **Class de Storage** `standard` 

```yaml
$ kubectl apply -f - <<EOF
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: standard
  annotations:
    openebs.io/cas-type: cstor
    cas.openebs.io/config: |
      - name: StoragePoolClaim
        value: "cstor-disk-pool"
      - name: ReplicaCount
        value: "3"
provisioner: openebs.io/provisioner-iscsi
EOF
```

- [ ] après avoir modifier la valeur du champ `ReplicaCount` au nombre de noeuds sur la grappe (idéalement :three:)
- [ ] sauvegarder sous le nom `StorageClass.md` dans le répertoire de votre grappe
- [ ] Exécuter la commande `kubectl` à partir du fichier.


:round_pushpin: La classe par défaut de stockage `standard`

- [ ] Vérifier la classe de stockage `standard`

```
$ kubectl get storageclass standard
NAME       PROVISIONER                    RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
standard   openebs.io/provisioner-iscsi   Delete          Immediate           false                  74s
```

- [ ] Appliquer le stockage par défaut à **standard**

```
$ kubectl patch storageclass standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

- [ ] Vérifier le stockage par défaut

```
$ kubectl get sc          
NAME                        PROVISIONER                                                RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
openebs-device              openebs.io/local                                           Delete          WaitForFirstConsumer   false                  20h
openebs-hostpath            openebs.io/local                                           Delete          WaitForFirstConsumer   false                  20h
openebs-jiva-default        openebs.io/provisioner-iscsi                               Delete          Immediate              false                  20h
openebs-snapshot-promoter   volumesnapshot.external-storage.k8s.io/snapshot-promoter   Delete          Immediate              false                  20h
standard (default)          openebs.io/provisioner-iscsi                               Delete          Immediate              false                  48s
```

# References

https://technology.amis.nl/platform/openebs-cstor-storage-engine-on-kvm/


