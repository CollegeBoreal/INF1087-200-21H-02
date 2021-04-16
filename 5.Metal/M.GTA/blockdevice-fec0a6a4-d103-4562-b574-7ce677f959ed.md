```yaml
$ kubectl apply --namespace openebs --filename - <<EOF 
 apiVersion: openebs.io/v1alpha1
 kind: BlockDevice
 metadata:
   name: blockdevice-fec0a6a4-d103-4562-b574-7ce677f959ed
   labels:
     kubernetes.io/hostname: mississauga
     ndm.io/managed: "false"
     ndm.io/blockdevice-type: blockdevice
 status:
   claimState: Unclaimed
   state: Active
 spec:
   capacity:
     logicalSectorSize: 512
     storage: 293563949056 
   details:
     deviceType: lvm
   devlinks:
   - kind: by-id
     links:
     - /dev/disk/by-id/dm-uuid-LVM-JvBoYuIhqI6y1MbKoABNv8T2VszkYpFjs8w0LQf75D3x40maUxIqQJautkA9GhRe
     - /dev/disk/by-id/dm-name-ubuntu--vg-iscsi--lv
   - kind: by-path
     links:
     - /dev/mapper/ubuntu--vg-iscsi--lv
   nodeAttributes:
     nodeName: mississauga
   path: /dev/dm-1
---
EOF

```
