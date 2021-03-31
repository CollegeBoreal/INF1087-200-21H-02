# kubelet :droplet:

| Service | Utilisation                                                   |
|---------|--------------------------------------------------------------------------------------------------------------------------|
| kubelet | Responsable de maintainir un ensemble de `pods`, qui sont composé d'un ou de plusieurs conteneurs, dans un système local |

- [ ] Let's install a specific version

```
$ export KUBEVERSION=1.18.6
``` 

## :zero: Install the packages 

[< previous page](Control-Plane.md) to find the Google PGP Key :key: and Repository Artifact. (if not already installed)

:round_pushpin: Install the `kubelet` service package

```
$ sudo apt update && sudo apt -y install kubelet=${KUBEVERSION}-00
Hit:1 http://ca.archive.ubuntu.com/ubuntu focal InRelease
Hit:3 http://ca.archive.ubuntu.com/ubuntu focal-updates InRelease          
Hit:4 https://download.docker.com/linux/ubuntu focal InRelease             
Hit:5 http://ca.archive.ubuntu.com/ubuntu focal-backports InRelease
Hit:6 http://ca.archive.ubuntu.com/ubuntu focal-security InRelease
Hit:2 https://packages.cloud.google.com/apt kubernetes-xenial InRelease
Reading package lists... Done
Building dependency tree       
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be DOWNGRADED:
  kubelet
0 upgraded, 0 newly installed, 1 downgraded, 0 to remove and 2 not upgraded.
E: Packages were downgraded and -y was used without --allow-downgrades.
```

:round_pushpin: Prevent the `kubelet` service package from being altered (optional)

```
$ sudo apt-mark hold kubelet
```


## :gear: Where is the `kubelet` [drop-in file](https://stackoverflow.com/questions/59842743/what-is-a-drop-in-file-what-is-a-drop-in-directory-how-to-edit-systemd-service) (i.e. systemd .conf file)

```
$ sudo cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
```

## :one: Just after package management install

:+1: Test that the `kubelet` service is just loaded

```
$ systemctl status kubelet
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/lib/systemd/system/kubelet.service; enabled; vendor preset: enabled)
    Drop-In: /etc/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: activating (auto-restart) (Result: exit-code) since Sun 2021-02-14 11:30:15 UTC; 2s ago
       Docs: https://kubernetes.io/docs/home/
    Process: 315103 ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EX>
   Main PID: 315103 (code=exited, status=255/EXCEPTION)
```

## :two: Booting up the :droplet: `kubelet` service

``` 
$ sudo systemctl enable kubelet && sudo systemctl start kubelet
```

# References

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/kubelet-integration/
