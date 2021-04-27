# Deployer l'application moodle sur Lens en quelques étapes:


## :one: Verifiez que le service Kubelet est actif , en mode "Running", c'est ce dernier qui gere les applications dans kubernetes


## Assurez-vous que tous les noeuds de la grappe sont en mode "Ready":



## Installation de Moodle:

Allez dans l'onglet **App** puis **Release** et taper **Moodle**


### Appliquer votre fichier de configuration 

vous aurez au préalable modifié en changeant la ligne "name: moodle-1619103057" par votre id que vous recevrez en installant l'application (Voir image suivante)

![image](https://user-images.githubusercontent.com/55238107/116185333-619ce980-a6ef-11eb-94a6-94f1f80768c2.png)


**Resultat**

![image](https://user-images.githubusercontent.com/55238107/116185060-dd4a6680-a6ee-11eb-9cd8-278b4000bc77.png)



## Rendez-vous sur Lens

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

