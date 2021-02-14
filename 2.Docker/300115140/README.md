# DOCKER IMAGE EXERCICE - INSTALL AND RUN NODEJS INTO DOCKER

<img src="https://github.com/CollegeBoreal/INF1087-200-21H-02/blob/main/2.Docker/300115140/IMAGES/docker1.PNG" width="350">

## SOMMAIRE
1. Introduction
2. how to install the image on docker
3. créer l'app Node.js
4. créer app directory
5. aller sur le local host



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





