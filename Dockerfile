ARG PYTHON_VERSION=3.9.7
ARG GOOGLE_APPLICATION_CREDENTIALS="test.json"

FROM python:${PYTHON_VERSION}-slim-buster

RUN apt-get update 

RUN apt-get install -y git

RUN apt-get update

RUN apt-get install -y curl gnupg lsb-release

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

RUN apt-get update && apt-get install -y google-cloud-sdk

RUN gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}

COPY . /





ENTRYPOINT ["python3", "/entrypoint.py"]
