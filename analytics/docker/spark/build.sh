#!/bin/bash

source ../docker_version.conf

${SPARK_VERSION?"Need to set SPARK_VERSION"}
${SBT_VERSION?"Need to set SBT_VERSION"}
${HADOOP_VERSION?"Need to set HADOOP_VERSION"}

cat Dockerfile.template | \
sed -e "s/{{ SPARK_VERSION }}/$SPARK_VERSION/" \
    -e "s/{{ SPARK_BIN_VERSION }}/$SPARK_BIN_VERSION/" \
    -e "s/{{ SBT_VERSION }}/$SBT_VERSION/" \
    -e "s/{{ HADOOP_VERSION }}/$HADOOP_VERSION/" \
> Dockerfile

sudo docker build -t rahimre/spark:$SPARK_VERSION .
sudo docker push  rahimre/spark:$SPARK_VERSION
