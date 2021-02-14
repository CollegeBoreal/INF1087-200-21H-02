# DOCKER IMAGE EXERCICE - INSTALL AND RUN NODEJS INTO DOCKER

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/docker1.PNG" width="350">

## SOMMAIRE
1. Introduction
2. How to install the image on docker
3. Creating th app
4. Running the image
5. The local Host



## INTRODUCTION

This exercice aims to create a Dockerfile and improve it with Shell commands under Unix. It is inspired from the book 'Docker in action' from Jeff Nickoloff', the tutorial video on Linkedin called 'Docker Essential Training 3' and the official website Docs fo NodeJS, www.nodejs.org
We will use Nodejs to demonstrate the installation and the running of the image on Docker.
Node.js is a platform built with Chrome's JavaScript for easily building fast network applications. Node.js uses a non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.  

|<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/livr1.PNG" width="250">| <img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/Link1.PNG" width="350"> | <img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/node1.PNG" width="350">

## How to install the image on Docker

We will be doing this exercice following the instructions on the officiall NodejS website: https://nodejs.org/en/docs/guides/

Step 1: Create a New Directory for all the files - then create a file called package.json to describe the app and its dependencies:
```

{
  "name": "docker_web_app",
  "version": "1.0.0",
  "description": "Node.js on Docker",
  "author": "First Last <first.last@example.com>",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.16.1"
  }
}

```


Step 2: run npm install to generate a package-lock.json to be copied to the Docker image.

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/npm.PNG" width="350">


Step 3: add a file called server.js to define the framework. The framework used will be Express.js
Express is a minimal and flexible Node.js web application framework providing a robust set of features for web and mobile applications (www.expressjs.com)

```
'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

```


Step 3: creating a Dockerfile 
You can create a Dockerfile file with the command touch Dockerfile
Once you created the Dockerfile, you can enter the file on Bash with the command nano Dockerfile OR you can prepare all the modifications first on a Notepad and then copy the elements by entering Dockerfile.
There are indeed differents changes to make and I will explain why:

The final work should look like this:

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/nano.PNG" width="350">

So what did we do?

We first define the image we are building from : FROM node:14 
It is the lastest LTS (long term support) version available.
Then we create a directory to have the code inside : WORKDIR /usr/src/app

With the npm binary, then we install the dependencies. We use the copy instruction then to bundle the app inside the Docker image.

After that, we need to add the port 8080 with the following commande: EXPOSE 8080

Finally, we define the command using CMD: CMD ["node", "server.js"]


Step 4: Create a .dockerignore file

It will help to avoid having modules or logs copied into the Docker image.

```
node_modules
npm-debug.log
```

Step 5: Build the image
Into the directory with Dockerfile, we need to run the command to build the Docker image

I will name the image zackito

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/build.PNG" width="450">

We can check the image with the command docker images:

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/ima.PNG" width="450">


## Running the image

To run the image in the detached mode with -d, using also the flag -pto redirect to a private port inside a container:

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/ima2.PNG" width="650">


To see the Image ID, the ports used, run the commande: docker ps

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/ima3.PNG" width="650">










