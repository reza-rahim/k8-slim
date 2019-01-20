#!/bin/bash
source ../docker_version.conf

${HADOOP_VERSION?"Need to set HADOOP_VERSION"}
cat Dockerfile.template | sed -e "s/{{ HADOOP_VERSION }}/$HADOOP_VERSION/" > Dockerfile
sudo docker build -t rahimre/hadoop:$HADOOP_VERSION .
sudo docker push  rahimre/hadoop:$HADOOP_VERSION
