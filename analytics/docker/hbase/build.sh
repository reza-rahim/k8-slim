#!/bin/bash

source ../docker_version.conf

${HADOOP_VERSION?"Need to set HADOOP_VERSION"}
${HBASE_VERSION?"Need to set HBASE_VERSION"}
${PHOENIX_VERSION?"Need to set PHOENIX_VERSION"}

cat Dockerfile.template | \
sed -e "s/{{ HADOOP_VERSION }}/$HADOOP_VERSION/" \
    -e "s/{{ HBASE_VERSION }}/$HBASE_VERSION/" \
    -e "s/{{ PHOENIX_VERSION }}/$PHOENIX_VERSION/" \
> Dockerfile


sudo docker build -t rahimre/hbase:$HBASE_VERSION .
sudo docker push  rahimre/hbase:$HBASE_VERSION
