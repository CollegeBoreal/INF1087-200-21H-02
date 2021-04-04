# OpenEBS



## :o2: Installation



```
$ helm install openebs openebs/openebs --namespace openebs
NAME: openebs
LAST DEPLOYED: Sun Apr  4 11:25:42 2021
NAMESPACE: openebs
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The OpenEBS has been installed. Check its status by running:
$ kubectl get pods -n openebs

For dynamically creating OpenEBS Volumes, you can either create a new StorageClass or
use one of the default storage classes provided by OpenEBS.

Use `kubectl get sc` to see the list of installed OpenEBS StorageClasses. A sample
PVC spec using `openebs-jiva-default` StorageClass is given below:"

---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: demo-vol-claim
spec:
  storageClassName: openebs-jiva-default
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5G
---

Please note that, OpenEBS uses iSCSI for connecting applications with the
OpenEBS Volumes and your nodes should have the iSCSI initiator installed.

For more information, visit our Slack at https://openebs.io/community or view the documentation online at http://docs.openebs.io/.
```


$ helm ls --namespace openebs
NAME   	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART        	APP VERSION
openebs	openebs  	1       	2021-04-04 11:25:42.579325 -0400 EDT	deployed	openebs-2.7.0	2.7.0   
