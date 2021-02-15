## :o: improving a Node.js application's Docker image

<img src=images/4.PNG  alt="alt text" width="750" height="400">


**Step 1:** Create a new Dockerfile: 
[image2.npg]
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
------------------------------

<img src=images/image1.png  alt="alt text" width="450" height="800">
