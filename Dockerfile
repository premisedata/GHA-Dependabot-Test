FROM python:3.9.17-slim-buster

RUN apt-get update

RUN apt-get install -y git

COPY entrypoint.py /entrypoint.py

ENTRYPOINT ["python3", "/entrypoint.py"]
