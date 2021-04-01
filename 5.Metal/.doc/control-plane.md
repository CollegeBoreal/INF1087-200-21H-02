# :control_knobs: Le plan de contrôle (control plane)


:x: Le plan de contrôle est également appelé `master` mais ce therme devrait être utilisé avec rétention

:warning: Les commandes ci-dessous doivent se faire sur le serveur que vous avez choisi pour `plan de contrôle`

## :a: Installer le plan de contrôle

:round_pushpin: Télécharger les images (pour accélérer le processus)

```
$ sudo kubeadm config images pull
```

* Véfifier l'installation des images

```
$ sudo kubeadm config images list
[sudo] password for ubuntu: 
I0314 03:49:12.111805   33645 version.go:252] remote version is much newer: v1.20.4; falling back to: stable-1.18
W0314 03:49:12.338372   33645 configset.go:202] WARNING: kubeadm cannot validate component configs for API groups [kubelet.config.k8s.io kubeproxy.config.k8s.io]
k8s.gcr.io/kube-apiserver:v1.18.16
k8s.gcr.io/kube-controller-manager:v1.18.16
k8s.gcr.io/kube-scheduler:v1.18.16
k8s.gcr.io/kube-proxy:v1.18.16
k8s.gcr.io/pause:3.2
k8s.gcr.io/etcd:3.4.3-0
k8s.gcr.io/coredns:1.6.7
```

:round_pushpin: Initialiser la grappe

`<LE PLAN DE CONTROLE DE VOTRE GRAPPE>` doit être un nom de serveur avec son domaine par exemple `betelgeuse.boreal.codes`

```
$ sudo kubeadm init \
  --pod-network-cidr=172.16.0.0/16 \
  --control-plane-endpoint=<LE PLAN DE CONTROLE DE VOTRE GRAPPE>
```

:tada: Your Kubernetes control-plane has initialized successfully!

:round_pushpin: To start using your cluster, you need to run the following as a regular user:

```
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
$ export KUBECONFIG=$HOME/.kube/config
```

Alternatively, if you are the root user, you can run:

```
$ export KUBECONFIG=/etc/kubernetes/admin.conf
```

:round_pushpin: Check the current context (when being on the control plane node)

```
$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```

:round_pushpin: Check the current nodes (with `kubectl`)

```
$ kubectl get nodes
NAME         STATUS     ROLES    AGE     VERSION
betelgeuse   NotReady   master   4m23s   v1.18.6
```

:warning: Not yet ready 

## :eight: You should now deploy a pod network to the cluster.

[Install Pod Network](kubelet.md#five-install-the-cni-plugin)

## :nine: Confirm that all of the pods are running

```
$ watch kubectl get pods --all-namespaces
```

CTRL+C to exit

```
Every 2.0s: kubectl get pods --all-namespaces                             betelgeuse: Sun Mar 14 04:04:34 2021

NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-65d7476764-bwwrb   1/1     Running   0          2m19s
kube-system   calico-node-dr7x4                          1/1     Running   0          2m19s
kube-system   coredns-66bff467f8-6qhnw                   1/1     Running   0          13m
kube-system   coredns-66bff467f8-ldp4p                   1/1     Running   0          13m
kube-system   etcd-betelgeuse                            1/1     Running   0          13m
kube-system   kube-apiserver-betelgeuse                  1/1     Running   0          13m
kube-system   kube-controller-manager-betelgeuse         1/1     Running   0          13m
kube-system   kube-proxy-fj79t                           1/1     Running   0          13m
kube-system   kube-scheduler-betelgeuse                  1/1     Running   0          13m
```

or just `watching` the kube-system namespace

```
$ kubectl get pods --namespace kube-system --watch
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-65d7476764-bwwrb   1/1     Running   0          3m8s
calico-node-dr7x4                          1/1     Running   0          3m8s
coredns-66bff467f8-6qhnw                   1/1     Running   0          13m
coredns-66bff467f8-ldp4p                   1/1     Running   0          13m
etcd-betelgeuse                            1/1     Running   0          14m
kube-apiserver-betelgeuse                  1/1     Running   0          14m
kube-controller-manager-betelgeuse         1/1     Running   0          14m
kube-proxy-fj79t                           1/1     Running   0          13m
kube-scheduler-betelgeuse                  1/1     Running   0          14m
```


- [ ] Confirm master node is ready:

:round_pushpin: Check the nodes once again

```
$ kubectl get nodes --output=wide
NAME         STATUS   ROLES    AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
betelgeuse   Ready    master   15m   v1.18.6   10.13.15.200   <none>        Ubuntu 20.04.2 LTS   5.4.0-66-generic   docker://20.10.3
```

:tada: Ready

