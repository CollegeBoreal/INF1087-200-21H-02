
# :rocket: Java Hello World avec Dockerfile
-----------------------------------
## :a: Dockerfile
  Mon fichier Dockerfile vas me permettre de creer une image contenant notre environnement java pour pouvoir afficher Hello World a la creation du conteneur de notre conteneur
 ### Dockerfile
 ```
FROM java:8
WORKDIR /var/www/java
COPY . /var/www/java
RUN javac HelloWorld.java
CMD ["java","HelloWorld"]

 ```
### :1: FROM java:8
notre image java:8 contient deja tout l'environnement necessaire

### :2: WORKDIR /var/www/java
j'utilise le repertoire **/var/www/java** comme repertoire de travail

### :3: COPY . /var/www/java
je copie mes fichier dans mon repertoire de travail

### :4: RUN javac HelloWorld.java
j'excecute mon script **HelloWorld.java** a la creation/execution de notre conteneur

### :5: CMD ["java","HelloWorld"]
je donne la commande  **java HelloWorld** au demarrage du conteneur
