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
    - blockdevice-254dcb50-2e71-4502-95d8-44844a45f679
    - blockdevice-44870f16-77fc-4bb5-9ad0-0c6f7fb01578
    - blockdevice-e4cdeaed-5419-4518-b2a3-1df52d94ca9e
---
EOF

```
