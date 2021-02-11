#mon exemple dockerfiles
FROM ubuntu:latest
LABEL maintainer="mrgt747@gmail.com"

RUN apt-get update && apt-get install -y git
RUN sudo apt-get install python 3
COPY . /app
RUN make /app
CMD python /app/app.py
ENTRYPOINT ["git"]
