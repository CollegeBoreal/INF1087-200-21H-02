<<<<<<< HEAD
From python:3.8
WORKDIR /code 
COPY requirements.txt .
RUN pip install -r requirements.txt 

COPY src/ .
CMD ["python", "./server.py"]
=======
FROM ubuntu:latest

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
>>>>>>> a9132a3489e990ca1ab0a29a80cd19f3a3203188
