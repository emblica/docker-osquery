FROM debian:stable-slim


ENV OSQUERY_KEY=1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B
WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y \
        gnupg \
        software-properties-common \
        apt-transport-https \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $OSQUERY_KEY \
    && add-apt-repository 'deb [arch=amd64] https://pkg.osquery.io/deb deb main' \
    && apt-get update \
    && apt-get install osquery \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
