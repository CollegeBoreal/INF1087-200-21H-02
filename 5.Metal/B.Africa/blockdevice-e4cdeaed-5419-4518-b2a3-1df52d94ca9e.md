
```yaml

$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-e4cdeaed-5419-4518-b2a3-1df52d94ca9e
   labels:
     kubernetes.io/hostname: guinee
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
     - /dev/disk/by-id/dm-uuid-LVM-cfxDXYikVxenYnWiSAn77FJVA0NWhsmJce7RJOGCcrDrOzQnyTQ3L1TRBo0hPXCA
     - /dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv
   - kind: by-path
     links:
     - /dev/mapper/ubuntu--vg-iscsi--lv
   nodeAttributes:
     nodeName: guinee
   path: /dev/dm-1
---
EOF

```
