
# Creating Services with Docker-Compose

First of all, a directory needs to be created where we can store the docker-compose.yml file for the project.

```
$ mkdir composetest
$ cd composetest
```
This file defines the docker containers we want to create, in this case we are using the mysql:5.7 and the wordpress:latest images. We are also specifying two docker volumes, which will be created to store the mysql databases and the wordpress 


## We use the docker compose up command to create the containers specified in the docker-compose.yml file:

```

$ docker-compose up -d

```


In this example I have also used the -d flag which is detached mode, meaning that the containers will run in the background. Running docker ps now will show the newly created running containers:

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
d0c119d3af19        wordpress:latest    "docker-entrypoint.s…"   31 hours ago        Up 25 minutes       0.0.0.0:8000->80/tcp   composetest_wordpress_1
dcd325fd82ac        mysql:5.7           "docker-entrypoint.s…"   31 hours ago        Up 25 minutes       3306/tcp, 33060/tcp    composetest_db_1content.
```

# We can also use the docker-compose ps command:computer:

```
$ docker-compose ps 
```

Docker volume list shows that the two volumes have been created:

```
$ docker volume list
DRIVER              VOLUME NAME
local               composetest_db_data
local               composetest_web_data
```
For the wordpress container, port 80 was exposed (port 8000 on the docker host):

```
ports:
       - "8000:80"

```

# REFERENCES:computer:
https://buildvirtual.net/how-to-use-docker-compose-tutorial-with-examples/


