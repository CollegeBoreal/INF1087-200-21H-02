# :droplet: CNI Plugin

## :a: Installer the CNI Plugin pour gérer le réseau de gousses (PD Network)

[Cluster Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/)

* Exécuter "kubectl apply -f [podnetwork].yaml" with one of the options listed at:

https://kubernetes.io/docs/concepts/cluster-administration/addons/

- [ ] Let's use [Calico](projectcalico.org) CNI

```
$ kubectl apply --filename=https://docs.projectcalico.org/manifests/calico.yaml
configmap/calico-config created
customresourcedefinition.apiextensions.k8s.io/bgpconfigurations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/bgppeers.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/blockaffinities.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/clusterinformations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/felixconfigurations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/globalnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/globalnetworksets.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/hostendpoints.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipamblocks.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipamconfigs.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipamhandles.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ippools.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/kubecontrollersconfigurations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/networkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/networksets.crd.projectcalico.org created
clusterrole.rbac.authorization.k8s.io/calico-kube-controllers created
clusterrolebinding.rbac.authorization.k8s.io/calico-kube-controllers created
clusterrole.rbac.authorization.k8s.io/calico-node created
clusterrolebinding.rbac.authorization.k8s.io/calico-node created
daemonset.apps/calico-node created
serviceaccount/calico-node created
deployment.apps/calico-kube-controllers created
serviceaccount/calico-kube-controllers created
poddisruptionbudget.policy/calico-kube-controllers created
```

- [ ] Check the :droplet: `Kubelet` service after installing the CNI

```
$ sudo systemctl status kubelet
[sudo] password for ubuntu: 
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
    Drop-In: /etc/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: active (running) since Wed 2021-02-17 22:52:11 UTC; 3h 45min ago
       Docs: https://kubernetes.io/docs/home/
   Main PID: 1130554 (kubelet)
      Tasks: 27 (limit: 77183)
     Memory: 59.2M
     CGroup: /system.slice/kubelet.service
             └─1130554 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet>

Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.422 [INFO][1182279] ipam.go 970: Writing block in order to claim IPs block=192>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.426 [INFO][1182279] ipam.go 983: Successfully claimed IPs: [192.168.46.3/26] b>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.426 [INFO][1182279] ipam.go 706: Auto-assigned 1 out of 1 IPv4s: [192.168.46.3>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.427 [INFO][1182279] ipam_plugin.go 255: Calico CNI IPAM assigned addresses IPv>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.428 [INFO][1182250] k8s.go 372: Populated endpoint ContainerID="f947f87d7d0bdd>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.429 [INFO][1182250] k8s.go 373: Calico CNI using IPs: [192.168.46.3/32] Contai>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.429 [INFO][1182250] dataplane_linux.go 66: Setting the host side veth name to >
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.434 [INFO][1182250] dataplane_linux.go 420: Disabling IPv4 forwarding Containe>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.472 [INFO][1182250] k8s.go 400: Added Mac, interface name, and active containe>
Feb 18 02:36:35 orion kubelet[1130554]: 2021-02-18 02:36:35.483 [INFO][1182250] k8s.go 474: Wrote updated endpoint to datastore ContainerI>
lines 1-22/22 (END)
```
