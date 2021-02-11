
# :rocket: Java Hello World avec Dockerfile
-----------------------------------
## :a: Dockerfile
  mon fichier Dockerfile vas me permettre de creer une image contenant notre environnement java pour pouvoir afficher Hello World a la creation du conteneur
 ```
  FROM java:8
WORKDIR /var/www/java
COPY . /var/www/java
RUN javac HelloWorld.java
CMD ["java","HelloWorld"]

 ```
