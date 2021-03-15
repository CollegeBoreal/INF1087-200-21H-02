# EXPLICATION DOCKER-COMPOSE.YML

### Notre docker-compose est composé de 2 container

## container :one: de gitlab

```

```
### :a: Démonstration sur le navigateur

#### :volcano: Determiner votre mot de passe

:point_down:

![image](images/mdp_gitlab.png)

:speech_balloon: Connecter vous avec **username** = `root` **mot de passe** = `le mot de passe que vous venez de définir` :point_up:

![image](images/login.png)

:boom: Et voilà vous pouvez monitorer vos projets :boom:

:b: Démonstration avec le CLI

-dans ce cas

   -connexion à la console gitlab `docker container exec --tty --interactive 9f7d4237ec70 bash`
   
   -configuration `git config --global user.name "zoureni"` `git config --global user.email "gitlab.zoureni.com"`
   
   -accès au projet Monitoring `cd Monitoring`
   
   -clone  `git clone http://zoureni/gitlab-instance-d88eab10/Monitoring.git`
   
   -création de fichier README.md `touch README.md`
   
   -ajouter et commit et push au projet

![image](images/projet.png)  
 
Aperçu sur le navigateur

![image](images/projet1.png) 

