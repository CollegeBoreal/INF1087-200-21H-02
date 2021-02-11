## Laboratoire DockerFile
-------------------------------------
:one: Conteneuriser le service Node 
-------------------------------------
Mon fichier Dockerfile va me servir a creer une image contenant Node

## Dockerfile 
```
FROM node:7
ADD app.js /app.js
ENTRYPOINT ["node", "app.js"]
