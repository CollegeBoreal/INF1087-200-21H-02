# DOCKER-COMPOSE.YML

## exécution du docker-compose

`docker-compose up --detach`

### vérification 

`docker-compose ps`
```

```

`--------------------------------------------------------------------------------------------------`
## Explication du docker-compose.yml

### Notre docker-compose est composé de 2 container

## container :one: : gitlab
```
```
### :a: Démonstration sur le navigateur

#### :volcano: Determiner votre mot de passe

:point_down:

![image](images/mdp_gitlab.png)

:speech_balloon: Connecter vous avec **username** = `root` **mot de passe** = `le mot de passe que vous venez de définir` :point_up:

![image](images/login.png)

:boom: Et voilà vous pouvez gérer vos projets :boom:

#### :b: Démonstration avec le CLI

- dans ce cas

   - connexion à la console gitlab `docker container exec --tty --interactive 9f7d4237ec70 bash`
   
   - configuration `git config --global user.name "zoureni"` `git config --global user.email "gitlab.zoureni.com"`
   
   - accès au projet Monitoring `cd Monitoring`
   
   - clone  `git clone http://zoureni/gitlab-instance-d88eab10/Monitoring.git`
   
   - création de fichier README.md `touch README.md`
   
   - ajouter et commit et push au projet

![image](images/projet.png)  
 
Aperçu sur le navigateur

![image](images/projet1.png) 

```

```
`--------------------------------------------------------------------------------------------------`
## container :two: : portainer
```
```

### :a: :volcano: Determiner votre mot de passe

:point_down:

![image](images/mdp_portainer.png)

### :b: À quoi sert ce container :question:

- monitorer les conteneurs

   • Voir les ressources utilisées
   
   •	voir les logs des conteneurs
   
   •	inspecter la configuration des conteneurs…
   
![image](images/logs.png)

- gérer les conteneurs

   •	créer des conteneurs
   
   •	supprimer des conteneurs
   
   •	régénérer des conteneurs
   
   •	éditer des conteneurs
   
   •	redéployer des conteneurs
   
   •	démarrer des conteneurs
   
   •	éteindre des conteneurs
   
   •	redémarrer des conteneurs
   
   •	tuer des conteneurs
   
   •	mettre en pause des conteneurs
   
![image](images/start.png)

•	Gérer les images Docker

•	Gérer les réseaux

•	Gérer les volumes…

![image](images/gestion.png)

 
