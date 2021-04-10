 ## 🃏 Preparation du serveur
 

🐴: Assurez-vous que vous avez le bon nom d'hôte (en fonction de votre cluster) 
 ----------------------------------------------------------------------------
 ▪️ toronto

![image](images/1.1.PNG)

🐋: Désactiver le swap (sinon Kubernetes ne fonctionnera pas)
--------------------------------------------------------------
▪️:swap

![image](images/1.3.PNG)

🤸:Désactivé swap  au démarrage dans le file/etc/fstab
------------------------------------------------------------
![image](images/1.2.PNG)

🪀 Vérifiez que l'échange dans /etc/fstab est commentee
----------------------------------------------------
![image](images/1.4.PNG)

🎍 voir le pont
-----------------
![image](images/1.5.PNG)

☔:recharger la configuration
------------------------
![image](images/1.6.PNG)

## 🃏:Installation des outils

☁️: installer google cloud 
--------------------------
![image](images/2.1.PNG)

🔑: Ajouter la clé PGP
-------------------
![image](images/2.2.PNG)

◾ Vérifier que l'empreinte de la clé

![image](images/2.3.PNG)

💀: Ajouter le fichier kubernetes debian au référentiel
--------------------------------------------------------
![image](images/2.4.PNG)

## 🃏  Installer kubeadm and kubectl

▪️: Choisir une version spécifique de Kubernetes

![image](images/2.5.PNG)

🚆: Installer la version spécifique de Kubernetes
---------------------------------------------------
![image](images/2.6.PNG)

🍏:  Prévenir l'altération (mise à jour) des outils
----------------------------------------------------
 ![image](images/2.7.PNG)
 
 🧪: Tester que les outils sont installés
 ------------------------------------------
  ![image](images/2.8.PNG)
  
  ## 🥑: domain 
 ▪️ ping a mon domain 
 
 ![image](images/ping.PNG)                           ![image](images/domain.PNG)          ![image](images/ping1.PNG)        

 
  
  
  
## 🃏: Les plans

🥖: Installer le plan de contrôle ✍️
-------------------------------------

▪️  Télécharger les images 

![image](images/3.1.PNG)

▪️ Véfifier l'installation des images

![image](images/3.2.PNG)

 🎛️ Initialiser la grappe
 -------------------------
![image](images/3.3.PNG)                            ![image](images/3.4.PNG)


▪️ verifie le context 

 ![image](images/3.6.PNG)
 
 ▪️: Vérifier les noeux
  ![image](images/3.7.PNG)
 

## 🃏 Installer le plugin CNI

◾ Sur le serveur du plan de contrôle:

 ![image](images/4.1.PNG)
 
 ▪️ Vérifier le service  Kubelet après l'installation du plugin CNI
 
 ![image](images/4.2.PNG)
 


