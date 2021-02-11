#mon exemple dockerfiles
FROM ubuntu:latest
LABEL maintainer="mrgt747@gmail.com"

RUN make /app && apt-get update && apt-get install -y git
RUN apt-get install python 
COPY . /app
CMD python /app/app.py
ENTRYPOINT ["git"]
