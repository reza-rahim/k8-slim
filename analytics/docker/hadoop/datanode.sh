#!/bin/bash


cp /tmp/hdfs/* $HADOOP_HOME/etc/hadoop/
cp /tmp/core/* $HADOOP_HOME/etc/hadoop/


chown -R hdfs /data
#sudo -Eu hdfs $HADOOP_HOME/bin/hdfs datanode
