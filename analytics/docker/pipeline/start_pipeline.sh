#!/bin/bash

export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)
export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export YARN_CONF_DIR=/opt/hadoop/etc/hadoop

/opt/spark/bin/spark-submit --class KafkaDstreamPhx --master spark://sm-0.sm:7077 --jars /phoenix-${PHOENIX_VERSION}-client.jar --conf spark.executorEnv.ZK_LIST=$ZK_LIST /spark-stream-assembly-0.0.1-SNAPSHOT.jar ${KAFKA_BROKER_LIST}
