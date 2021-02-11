#mon exemple dockerfiles
FROM ubuntu:latest
LABEL maintainer="mrgt747@gmail.com"
COPY . /app
RUN make /app && apt-get update && apt-get install -y git
CMD python /app/app.py
ENTRYPOINT ["git"]
