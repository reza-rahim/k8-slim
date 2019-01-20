#!/bin/bash

source ../docker_version.conf

${SPARK_VERSION?"Need to set SPARK_VERSION"}
${ZEPPELIN_VERSION?"Need to set ZEPPELIN_VERSION"}

cat Dockerfile.template | \
sed -e "s/{{ ZEPPELIN_VERSION }}/$ZEPPELIN_VERSION/" \
    -e "s/{{ SPARK_VERSION }}/$SPARK_VERSION/" \
    -e "s/{{ PHOENIX_VERSION }}/$PHOENIX_VERSION/" \
> Dockerfile

sudo docker build -t rahimre/zeppelin:$ZEPPELIN_VERSION .
sudo docker push rahimre/zeppelin:$ZEPPELIN_VERSION 
