# :::::: 🌟Deployer l'application moodle sur Lens en quelques étapes 🌟 ::::::


## :one: Verifiez que le service Kubelet est actif , en mode "Running", 

c'est ce dernier qui gere les applications dans kubernetes

![image](https://user-images.githubusercontent.com/55238107/116186385-85f9c580-a6f1-11eb-8ba5-7b158e63e0af.png)



## 2️⃣ Assurez-vous que tous les noeuds de la grappe sont en mode "Ready":

![image](https://user-images.githubusercontent.com/55238107/116186263-4632de00-a6f1-11eb-8d1f-c0a4a1dd3d94.png)

![image](https://user-images.githubusercontent.com/55238107/116186303-56e35400-a6f1-11eb-8b13-18d8013f0cb3.png)


## 3️⃣ Installation de Moodle:

Allez dans l'onglet **App** >>> **Release** et taper **Moodle** dans la barre de recherche puis **Installer**

![image](https://user-images.githubusercontent.com/55238107/116186145-0a981400-a6f1-11eb-88c1-1062c2fdf5bd.png)


### ✔️ Appliquer votre fichier de configuration ✔️

vous aurez au préalable modifié en changeant la ligne "name: moodle-1619103057" par votre id que vous recevrez en installant l'application (Voir image suivante)

![image](https://user-images.githubusercontent.com/55238107/116185333-619ce980-a6ef-11eb-94a6-94f1f80768c2.png)


**Resultat**

![image](https://user-images.githubusercontent.com/55238107/116185060-dd4a6680-a6ee-11eb-9cd8-278b4000bc77.png)



## 4️⃣ Ouvrir l'application: 

Cliquez sur la ligne entourée ci-dessous pour ouvrir l'application

![image](https://user-images.githubusercontent.com/55238107/116186576-eee13d80-a6f1-11eb-9dec-e07a480fa283.png)


On vérifie sur Lens si les pods sont "running":

![image](https://user-images.githubusercontent.com/55238107/116186997-b1c97b00-a6f2-11eb-9a69-18d0ad818608.png)


**Résultat final** :

![image](https://user-images.githubusercontent.com/55238107/116187816-45e81200-a6f4-11eb-8df4-f727734a8b01.png)


On a une erreur ZUT
                                                                                                                                                                                                                                                                   


