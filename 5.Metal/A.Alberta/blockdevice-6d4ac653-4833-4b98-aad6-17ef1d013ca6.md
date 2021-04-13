```yaml
$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-6d4ac653-4833-4b98-aad6-17ef1d013ca6
   labels:
     kubernetes.io/hostname: beaumont
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
     - /dev/disk/by-id/dm-uuid-LVM-piBU4kMxoWNJdJKoPmncYZEb1NuGwO2at2TPoI18OPP44OL0QmyWoI66x7A4Nhbl 
     - /dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv
   - kind: by-path
     links:
     - /dev/mapper/ubuntu--vg-iscsi--lv
   nodeAttributes:
     nodeName: beaumont
   path: /dev/dm-1
---
EOF
```
