# :zap: Python web application running on Docker Compose:zap: 
:star:On this page you build a simple Python web application running on Docker Compose. The application uses the Flask framework and maintains a hit counter in Redis.

:star: Create a file called app.py in your project directory and paste this in
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

<img src=images/1.png  alt="alt text" width="800" height="150">



















https://docs.docker.com/compose/gettingstarted/

