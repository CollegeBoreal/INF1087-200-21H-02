
## Demonstration Dockerfile 
----------------------------

:one: Conteneuriser un service Python 
--------------------------------------
Nous montrons comment faire cela avec un service Flask simple de sorte que nous puissions l'exécuter de manière autonome sans avoir à configurer d'autres composants.

:fireworks: fichier server.py
------------------------------
```
from flask import Flask
server = Flask(__name__)

@server.route("/")
 def hello():
    return "Hello World!"

if __name__ == "__main__":
   server.run(host='0.0.0.0')
```
Afin d'exécuter ce programme, nous devons nous assurer que toutes les dépendances requises sont installées en premier. Une façon de gérer les dépendances consiste à utiliser un programme d'installation de package tel que pip. Pour cela, nous devons créer un fichier requirements.txt et y écrire les dépendances. Un exemple d'un tel fichier pour notre simple server.py est le suivant:

:sparkler: fichier requirements.txt
------------------------------------
```
Flask==1.1.1
```
Nous avons maintenant la structure suivante:
```
app
├─── requirements.txt
└─── src
     └─── server.py
```
Nous créons un répertoire dédié pour le code source afin de l'isoler des autres fichiers de configuration.
Pour exécuter notre programme Python, il ne reste plus qu'à installer un interpréteur Python et à l'exécuter. 

:two: Analyse d'un Dockerfile
-----------------------------
 Dockerfile contenant des instructions pour assembler une image Docker pour notre service Python hello world :
 
 :firecracker: Dockerfile
 -------------------------
 ```
 # set base image (host OS)
FROM python:3.8

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
CMD [ "python", "./server.py" ]
 ```
 
Pour chaque instruction ou commande du Dockerfile, 
le constructeur Docker génère un calque d'image et l'empile sur les précédents.

:dollar: creer image dockerfile et execute le container 
----------------------------

```
$ docker image build --tag b300116685:1.1 .
$ docker run -d -p 5000:5000 b300116685:1.1
$ curl http://localhost:5000
"Hello World!"

```


:link: https://www.docker.com/blog/containerized-python-development-part-1/

