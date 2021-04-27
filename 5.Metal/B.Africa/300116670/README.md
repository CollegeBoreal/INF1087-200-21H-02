# Deployer l'application moodle sur Lens:

## PREREQUIS:


Verifiez que le service Kubelet est actif , en mode "Running", c'est ce dernier qui gere les applications dans kubernetes


Ensuite,vérifiez si les nodes d ela grappes sont prêts (mode Ready):


<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/ready.PNG" width="850">


## Installation de Moodle:

J'ai décidé d'installer sur la grappe, l'application OrangeHRM.  
OrangeHRM Inc. est une société de logiciels RH, connue pour son système de gestion des ressources humaines. Le logiciel propose un niveau de produits open-source, professionnel et d'entreprise. Le niveau open-source est gratuit tandis que les niveaux professionnel et entreprise sont hébergés sur la base d'un logiciel en tant que service. 

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/oran.PNG" width="850">

Je vais sur Lens pour télécharger l'application:
<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/lens.PNG" width="850">


Après l'application, on va recevoir un identifiant pour le service, que l'on va mettre sur le fichier de configuration OrangeHRM.

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/service.PNG" width="850">

Voici le fichier de configuration en question

```
```yaml
$ kubectl apply --filename - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: orangehrm-1619103057
  annotations:
    lb.kubesphere.io/v1alpha1: porter
    protocol.porter.kubesphere.io/v1alpha1: layer2
    eip.porter.kubesphere.io/v1alpha2: porter-layer2-eip
spec:
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: http
    - name: https
      protocol: TCP
      port: 443
      targetPort: https
  type: LoadBalancer
---
EOF
```


## Exécuter l'application:

Ensuite il faut executer le fichier de configuration sur le PC:

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/keube.PNG" width="850">



<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/pending.png" width="850">



On vérifie sur Lens si tout cela marche, running.

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/running.PNG" width="850">
                                                                                                                                  
                                                                                                                                  
Voici le résultat au final lorqu'on a installé OrangeHRM:                                                                                                                             
<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/5.Metal/B.Africa/300115140/IMAGES/orange.png" width="850">

