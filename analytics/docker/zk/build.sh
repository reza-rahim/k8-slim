#!/bin/bash

source ../docker_version.conf

${ZOOKEEPER_VERSION?"Need to set ZOOKEEPER_VERSION"}

cat Dockerfile.template | \
sed -e "s/{{ ZOOKEEPER_VERSION }}/$ZOOKEEPER_VERSION/" \
> Dockerfile

sudo docker build -t rahimre/zookeeper:$ZOOKEEPER_VERSION .
sudo docker push  rahimre/zookeeper:$ZOOKEEPER_VERSION
