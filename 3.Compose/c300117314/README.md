# :zap: Python web application running on Docker Compose:zap: 
:star:On this page you build a simple Python web application running on Docker Compose. The application uses the Flask framework and maintains a hit counter in Redis.

:star: Create a file called `app.py` in your project directory and paste this in
```python
import time

import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)
```

:star:Create another file called `requirements.txt` in your project directory and paste this in:

``
flask
redis
``

:star:In this step, you write a Dockerfile that builds a Docker image. The image contains all the dependencies the Python application requires, including Python itself.

In your project directory, create a file named `Dockerfile` and paste the following:

```python

FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
```

This tells Docker to:

Build an image starting with the Python 3.7 image.
Set the working directory to `/code`.
Set environment variables used by the `flask` command.
Install gcc and other dependencies
Copy `requirements.txt` and install the Python dependencies.
Add metadata to the image to describe that the container is listening on port 5000
Copy the current directory `.` in the project to the workdir `.` in the image.
Set the default command for the container to `flask run`.

##
:star: Define services in a Compose file
Create a file called `docker-compose.yml` in your project directory and paste the following:

```python
version: "3.9"
services:
  web:
    build: .
    ports:
      - "5000:5000"
  redis:
    image: "redis:alpine"
```
This Compose file defines two services: `web` and `redis`.

:star:Build and run your app with Compose

## 
First turn on your docker container: 

<img src=images/1.PNG  alt="alt text" width="800" height="250">

##
Then go to your server and delete the container which are dead:
<img src=images/60.PNG  alt="alt text" width="800" height="250">


















https://docs.docker.com/compose/gettingstarted/

