## :o: improving a Node.js application's Docker image

<img src=images/4.PNG  alt="alt text" width="750" height="400">

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
RUN apt-get -y install nodejs && apt-get install -y git
# Install NPM dependencies
RUN npm install --prefix /app
EXPOSE 80
CMD ["npm", "start", "--prefix", "app"]
ENTRYPOINT ["git"]

```

## This is how the lines above can be read:

Using debian as the base image, it installs nodejs and npm in the system using the apt-get command. To run the application, it's necessary to install some extra system packages for the Node.js setup script to work, such as curl, imagemagick, software-properties-common, or gnupg. Furthermore, it installs vim and ssh packages for debugging purposes.

MAINTAINER—Sets the maintainer name and email for the image. Providing this information helps people know whom to contact if there’s a problem with the 
image. This was accomplished earlier when you invoked commit. 
RUN apt-get install –y git—Tells the builder to run the provided command to install Git.
ENTRYPOINT ["git"]—Sets the entrypoint for the image to git.

Once the image has all that it needs to build the application, it installs the application dependencies and uses the npm start command to start the application. The port 80 is exposed since the application uses it and it is specified with the expose parameter. 
------------------------------


**Step 2:** verifiying our Dockerfile:


<img src=images/1.PNG  alt="alt text" width="750" height="400">

------------------------------

**Step 3:** executing our Dockerfile in order to create our image: 


<img src=images/2.PNG  alt="alt text" width="750" height="400">


------------------------------

**Step 4:** Verifiying our image:


<img src=images/3.PNG  alt="alt text" width="750" height="400">
------------------------------


#refrences: 

:link: https://engineering.bitnami.com/articles/best-practices-writing-a-dockerfile.html

:link: https://pepa.holla.cz/wp-content/uploads/2016/10/Docker-in-Action.pdf
