#!/bin/bash

source ../docker_version.conf

${SPARK_VERSION?"Need to set SPARK_VERSION"}
${PHOENIX_VERSION?"Need to set PHOENIX_VERSION"}


cat Dockerfile.template | \
sed -e "s/{{ SPARK_VERSION }}/$SPARK_VERSION/" \
    -e "s/{{ PHOENIX_VERSION }}/$PHOENIX_VERSION/" \
> Dockerfile


sudo docker build -t rahimre/pipeline:0.0.1 .
sudo docker push  rahimre/pipeline:0.0.1
