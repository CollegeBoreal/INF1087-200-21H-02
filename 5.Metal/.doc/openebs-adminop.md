# OpenEBS - Operations d'administration

:control_knobs: Sur le plan de contrôle

https://docs.openebs.io/docs/next/ugcstor.html#admin-operations

## :a: Créer les Périphériques en mode bloc - BlockDevice CR (Custom Resource)


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

## :b: Storage Pool

- [ ] Create the `cStor Storage Pool` (csp)

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
    - blockdevice-23e1292d-32f5-4528-8f7f-3abaee070a03
    - blockdevice-3fa7d473-d0f1-4532-bcd4-a402241eeff1
    - blockdevice-7e848c90-cca2-4ef4-9fdc-90cff05d5bb5
---
EOF
```

:round_pushpin: Observe the `StoragePoolClaim`

```
$ kubectl get spc
NAME              AGE
cstor-disk-pool   7s
```

:round_pushpin: Observe the cStor Storage Pool 

* It may take some time to `Init`

:bulb: Use the [cStor CLI](https://docs.openebs.io/docs/next/cstor.html#cstor-cli) to display the Storage Engine artifacts

```
$ kubectl get csp --watch
NAME                   ALLOCATED   FREE    CAPACITY   STATUS    READONLY   TYPE      AGE
cstor-disk-pool-3oqs   83K         99.5G   99.5G      Healthy   false      striped   23s
cstor-disk-pool-thk6                                  Init      false      striped   23s
cstor-disk-pool-yit1   83K         99.5G   99.5G      Healthy   false      striped   23s
```

* It may take some time to `ALLOCATE` (i.e. 83K)

```
$ kubectl get csp --watch           
NAME                   ALLOCATED   FREE    CAPACITY   STATUS    READONLY   TYPE      AGE
cstor-disk-pool-3oqs   665K        99.5G   99.5G      Healthy   false      striped   95s
cstor-disk-pool-thk6   83K         99.5G   99.5G      Healthy   false      striped   95s
cstor-disk-pool-yit1   662K        99.5G   99.5G      Healthy   false      striped   95s
```

* Finally

```
$ kubectl get csp --watch
NAME                   ALLOCATED   FREE    CAPACITY   STATUS    READONLY   TYPE      AGE
cstor-disk-pool-3oqs   665K        99.5G   99.5G      Healthy   false      striped   4m59s
cstor-disk-pool-thk6   662K        99.5G   99.5G      Healthy   false      striped   4m59s
cstor-disk-pool-yit1   662K        99.5G   99.5G      Healthy   false      striped   4m59s
```

:round_pushpin: Block Devices are now `claimed`

```
$ kubectl get blockdevices -nopenebs
NAME                                               NODENAME    SIZE        CLAIMSTATE   STATUS   AGE
blockdevice-23e1292d-32f5-4528-8f7f-3abaee070a03   bellatrix   102687672   Claimed      Active   16m
blockdevice-3fa7d473-d0f1-4532-bcd4-a402241eeff1   saiph       102687672   Claimed      Active   16m
blockdevice-7e848c90-cca2-4ef4-9fdc-90cff05d5bb5   rigel       102687672   Claimed      Active   16m
```

## :ab: [Classe de Stockage](https://kubernetes.io/docs/concepts/storage/storage-classes/)

- [ ] Créer la **Class de Storage** `standard` 

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

- [ ] Vérifier

```
$ kubectl get storageclass standard
NAME       PROVISIONER                    RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
standard   openebs.io/provisioner-iscsi   Delete          Immediate           false                  74s
```

- [ ] Appliquer le stockage par défaut

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


