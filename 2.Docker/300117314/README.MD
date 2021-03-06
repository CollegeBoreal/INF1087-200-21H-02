## :o: improving a Node.js application's Docker image

<img src=images/10.PNG  alt="alt text" width="750" height="400">




**Step 1:** Create a new Dockerfile: 

------------------------------
```

FROM debian:9.5-slim
LABEL maintainer="mrgt747@gmail.com"
# Copy application files
COPY . /app

# Install required system packages
RUN apt-get update
RUN apt-get -y install imagemagick curl software-properties-common gnupg vim ssh
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get -y install nodejs 
# Install NPM dependencies
RUN npm install --prefix /app
EXPOSE 80
CMD ["start", "--prefix", "app"]
ENTRYPOINT ["npm"]

```
------------------------------


## This is how the lines above can be read:

Using debian as the base image, it installs nodejs and npm in the system using the apt-get command. To run the application, it's necessary to install some extra system packages for the Node.js setup script to work, such as curl, imagemagick, software-properties-common, or gnupg. Furthermore, it installs vim and ssh packages for debugging purposes.

MAINTAINER—Sets the maintainer name and email for the image. Providing this information helps people know whom to contact if there’s a problem with the 
image. This was accomplished earlier when you invoked commit. 


Once the image has all that it needs to build the application, it installs the application dependencies and uses the npm start command to start the application. The port 80 is exposed since the application uses it and it is specified with the expose parameter. 
------------------------------


**Step 2:** Then we will create the package.json file:


<img src=images/11.PNG  alt="alt text" width="750" height="550">

```
{
  "name": "express_example",
  "version": "1.0.0",
  "description": "Express App Example",
  "author": "Juan Ariza <juanariza@vmware.com>",
  "main": "server.js",
  "engines": {
    "node": ">=12"
  },
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.17.1"
  }
}

```
------------------------------

**Step 3:** Now it's the time to create server.js file with port number of host and our server: 

<img src=images/12.PNG  alt="alt text" width="750" height="550">


```
'use strict';

const express = require('express');
const fs = require('fs');

const myLogFileStream = fs.createWriteStream('/var/log/app.log');
const myConsole = new console.Console(myLogFileStream, myLogFileStream);

// Constants
const serverHost = '8000';
const serverPort = 80;

// Express app
const app = express();
app.get('/', (req, res) => {
  res.send('Hello Word\n');
});

app.listen(serverPort);
myConsole.log(`Running on http://${serverHost}:${serverPort}`);

```

------------------------------


**Step 4:** Let's start creation of our image:
```
$ docker image build --tag mortinode:20.0 .

```

<img src=images/18.PNG  alt="alt text" width="750" height="400">


------------------------------

**Step 5:**  How to Verify our image:

```
$ docker container ls --all

```

<img src=images/20.PNG  alt="alt text" width="900" height="100">


------------------------------
**Step 6:** How to execute our image:

```
$ docker container run --name mortiNode --publish 8000:80 --detach mortinode:20.0

```

<img src=images/21.PNG  alt="alt text" width="900" height="100">


------------------------------

**Step 7:** How to Verify our image:
```
$ docker container logs mortiNode

```
<img src=images/22.PNG  alt="alt text" width="700" height="100">

------------------------------
**Step 8:** How to verify our server:

<img src=images/23.PNG  alt="alt text" width="600" height="300">

------------------------------
#refrences: 

:link: https://github.com/juan131/dockerfile-best-practices

:link: https://engineering.bitnami.com/articles/best-practices-writing-a-dockerfile.html

:link: https://pepa.holla.cz/wp-content/uploads/2016/10/Docker-in-Action.pdf
