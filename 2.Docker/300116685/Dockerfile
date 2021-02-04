<<<<<<< HEAD
# set base image (host OS)
FROM python:3.8
COPY requirements.txt .
ADD server.py /server.py

# install dependencies
RUN pip install -r requirements.txt

# command to run on container start
ENTRYPOINT [ "python", "server.py" ]
=======
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
>>>>>>> 8cc5ea345799eed9ce45938e615e52d7ee8ea0ae
