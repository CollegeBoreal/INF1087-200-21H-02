# :round_pushpin: Conception de notre image
-----------------------------------
## :pushpin: Dockerfile
-------------------------------
  Mon fichier Dockerfile vas me permettre de creer une image contenant notre environnement Alpine 
 ### Dockerfile

```

FROM alpine
ADD event.sh /
ENTRYPOINT ["/event.sh"]

```

### :one: Configuration

Pour commencer, créons un script, log-event.sh. Il suffit d'ajouter une ligne à un fichier et de l'imprimer :

```

echo `date` $@ >> log.txt;
cat log.txt;

```
