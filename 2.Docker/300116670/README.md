#  Dockerizing a Node.js web app

<img src="data:image/png;base64,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" width="250"> 

## SOMMAIRE

1.Creer un fichier Node.js app
2.Creer un dockerfile
3.Creer le fichier .dockerignore 
4.Construire l'image
5.Executer l'image
6.Test



The goal of this example is to show you how to get a Node.js application into a Docker container. The guide is intended for development, and not for a production deployment. The guide also assumes you have a working Docker installation and a basic understanding of how a Node.js application is structured.

In the first part of this guide we will create a simple web application in Node.js, then we will build a Docker image for that application, and lastly we will instantiate a container from that image.

Docker allows you to package an application with its environment and all of its dependencies into a "box", called a container. Usually, a container consists of an application running in a stripped-to-basics version of a Linux operating system. An image is the blueprint for a container, a container is a running instance of an image.

Create the Node.js app
First, create a new directory where all the files would live. In this directory create a package.json file that describes your app and its dependencies:

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
With your new package.json file, run npm install. If you are using npm version 5 or later, this will generate a package-lock.json file which will be copied to your Docker image.

Then, create a server.js file that defines a web app using the Express.js framework:

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
In the next steps, we'll look at how you can run this app inside a Docker container using the official Docker image. First, you'll need to build a Docker image of your app.

Creating a Dockerfile
Create an empty file called Dockerfile:

touch Dockerfile
Open the Dockerfile in your favorite text editor

The first thing we need to do is define from what image we want to build from. Here we will use the latest LTS (long term support) version 10 of node available from the Docker Hub:

FROM node:10
Next we create a directory to hold the application code inside the image, this will be the working directory for your application:

# Create app directory
WORKDIR /usr/src/app
This image comes with Node.js and NPM already installed so the next thing we need to do is to install your app dependencies using the npm binary. Please note that if you are using npm version 4 or earlier a package-lock.json file will not be generated.

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
Note that, rather than copying the entire working directory, we are only copying the package.json file. This allows us to take advantage of cached Docker layers. bitJudo has a good explanation of this here. Furthermore, the npm ci command, specified in the comments, helps provide faster, reliable, reproducible builds for production environments. You can read more about this here.

To bundle your app's source code inside the Docker image, use the COPY instruction:

# Bundle app source
COPY . .
Your app binds to port 8080 so you'll use the EXPOSE instruction to have it mapped by the docker daemon:

EXPOSE 8080
Last but not least, define the command to run your app using CMD which defines your runtime. Here we will use node server.js to start your server:

CMD [ "node", "server.js" ]
Your Dockerfile should now look like this:

FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
.dockerignore file
Create a .dockerignore file in the same directory as your Dockerfile with following content:

node_modules
npm-debug.log
This will prevent your local modules and debug logs from being copied onto your Docker image and possibly overwriting modules installed within your image.

Building your image
Go to the directory that has your Dockerfile and run the following command to build the Docker image. The -t flag lets you tag your image so it's easier to find later using the docker images command:

docker build -t <your username>/node-web-app .
Your image will now be listed by Docker:

$ docker images

# Example
REPOSITORY                      TAG        ID              CREATED
node                            10         1934b0b038d1    5 days ago
<your username>/node-web-app    latest     d64d3505b0d2    1 minute ago
Run the image
Running your image with -d runs the container in detached mode, leaving the container running in the background. The -p flag redirects a public port to a private port inside the container. Run the image you previously built:

docker run -p 49160:8080 -d <your username>/node-web-app
Print the output of your app:

# Get container ID
$ docker ps

# Print app output
$ docker logs <container id>

# Example
Running on http://localhost:8080
If you need to go inside the container you can use the exec command:

# Enter the container
$ docker exec -it <container id> /bin/bash
Test
To test your app, get the port of your app that Docker mapped:

$ docker ps

# Example
ID            IMAGE                                COMMAND    ...   PORTS
ecce33b30ebf  <your username>/node-web-app:latest  npm start  ...   49160->8080
In the example above, Docker mapped the 8080 port inside of the container to the port 49160 on your machine.

Now you can call your app using curl (install if needed via: sudo apt-get install curl):

$ curl -i localhost:49160

HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 12
ETag: W/"c-M6tWOb/Y57lesdjQuHeB1P/qTV0"
Date: Mon, 13 Nov 2017 20:53:59 GMT
Connection: keep-alive

Hello world
We hope this tutorial helped you get up and running a simple Node.js application on Docker.

You can find more information about Docker and Node.js 
