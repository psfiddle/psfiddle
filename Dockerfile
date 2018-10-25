FROM ubuntu

LABEL maintainer="Nick Vissari <https://github.com/nickadam>"

ENV TZ America/New_York

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
      curl \
      npm \
      git \
      dumb-init \
      tzdata \
      apt-transport-https && \
    npm install -g n && \
    n latest

RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl -s https://packages.microsoft.com/config/ubuntu/18.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list && \
    apt-get update && \
    apt-get install -y powershell

COPY . /app

WORKDIR /app

ENTRYPOINT ["dumb-init", "sleep", "infinity"]
