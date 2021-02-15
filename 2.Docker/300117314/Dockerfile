#mon exemple dockerfiles
FROM dockerinaction/mailer-base:0.6
ADD ["./live-impl", "${APPROOT}"]
RUN apt-get update && \
apt-get install -y curl python && \
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
python get-pip.py && \
pip install awscli && \
rm get-pip.py && \
chmod a+x "${APPROOT}/${APP}"
RUN apt-get install -y netcat
USER example:example
CMD ["mailer@dockerinaction.com", "pager@dockerinaction.com"]

