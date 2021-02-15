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

