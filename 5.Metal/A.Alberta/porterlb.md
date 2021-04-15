```yaml
kubectl apply --filename - <<EOF
apiVersion: network.kubesphere.io/v1alpha2
kind: Eip
metadata:
  name: porter-layer2-eip
spec:
  address: 10.13.237.8-10.13.237.11
  interface: enp3s0f0
  protocol: layer2
EOF
```
