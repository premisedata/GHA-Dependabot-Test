ARG PYTHON_VERSION=3.9.7
FROM python:${PYTHON_VERSION}-slim-buster

RUN apt-get update 

RUN apt-get install -y git

RUN apt-get update

RUN apt-get install -y curl gnupg lsb-release

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

RUN apt-get update && apt-get install -y google-cloud-sdk

COPY . /

ENV GCP_ACCESS_TOKEN=${GCP_ACCESS_TOKEN}

RUN gcloud auth activate-service-account --token-file=${GCP_ACCESS_TOKEN}

COPY . /

RUN gcloud auth activate-service-account --token-file=${GCP_ACCESS_TOKEN}


ENTRYPOINT ["python3", "/entrypoint.py"]
