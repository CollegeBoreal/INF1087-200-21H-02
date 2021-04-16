```yaml
$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-71e4198b-be2b-41f1-aa58-b21c3e57809c
   labels:
     kubernetes.io/hostname: calgary
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
     - /dev/disk/by-id/dm-uuid-LVM-FIYM6I5CltGHgpoes7bZt63Wo0pQQ6GLXNQ7csWBoDG0Ic4JhSoQEjlKMzxhf3c5
     - /dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv  
   - kind: by-path
     links:
     - /dev/mapper/ubuntu--vg-iscsi--lv
   nodeAttributes:
     nodeName: calgary
   path: /dev/dm-1
   
---
EOF
```
