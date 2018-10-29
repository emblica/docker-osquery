FROM debian:stable-slim


ENV OSQUERY_KEY=1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B
WORKDIR /

RUN apt-get update \
    && apt-get install -y \
        wget \
    && wget https://pkg.osquery.io/linux/osquery-3.3.0_1.linux_x86_64.tar.gz \
    && tar -xzvf osquery-3.3.0_1.linux_x86_64.tar.gz \
    && rm -rf osquery-3.3.0_1.linux_x86_64.tar.gz \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
