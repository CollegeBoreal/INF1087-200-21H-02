```yaml

$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-4c10bc11-8d6d-4524-80e2-f1bfa2a96db7
   labels:
     kubernetes.io/hostname: congo
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
     - /dev/disk/by-id/dm-uuid-LVM-xWXaITen2h4UWHOXCZ4dN4OZZneo7pOCqeipTkzQypOKuanPlwG8x2mJdV96dDhK
     - /dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv
   - kind: by-path
     links:
     - /dev/mapper/ubuntu--vg-iscsi--lv
   nodeAttributes:
     nodeName: congo
   path: /dev/dm-1
---
EOF

```
