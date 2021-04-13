```yaml
$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-943643da-1a54-4b2f-b1fa-e1c27ba61b96
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
     - /dev/ubuntu-vg/iscsi-lv
   nodeAttributes:
     nodeName: brooks
   path: /dev/dm-1
---
EOF
```