# set base image (host OS)
FROM python:3.8
COPY requirements.txt .
ADD server.py /server.py

# install dependencies
RUN pip install -r requirements.txt

# command to run on container start
ENTRYPOINT [ "python", "server.py" ]
