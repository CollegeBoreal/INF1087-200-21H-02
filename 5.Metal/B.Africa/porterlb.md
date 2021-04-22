```yaml

$ kubectl apply --filename - <<EOF
apiVersion: network.kubesphere.io/v1alpha2
kind: Eip
metadata:
  name: porter-layer2-eip
spec:
  address: 10.13.237.12-10.13.237.15
  interface: enp2s0f0
  protocol: layer2
EOF

```
