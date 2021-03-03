FROM python:3.8 
WORKDIR /code
COPY requirements.txt .
COPY server.py .
RUN pip install -r requirements.txt 
CMD ["python", "server.py"]

