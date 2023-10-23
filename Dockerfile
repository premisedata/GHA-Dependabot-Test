ARG PYTHON_VERSION=3.9.7
FROM python:${PYTHON_VERSION}-slim-buster

RUN apt-get update 

RUN apt-get install -y git


COPY . /

RUN gcloud auth activate-service-account --token-file=${GCP_ACCESS_TOKEN}


ENTRYPOINT ["python3", "/entrypoint.py"]
