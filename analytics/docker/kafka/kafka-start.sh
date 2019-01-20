#!/bin/bash

HOST=`hostname -s`
DOMAIN=`hostname -d`

if [[ $HOST =~ (.*)-([0-9]+)$ ]]; then
        NAME=${BASH_REMATCH[1]}
        ORD=${BASH_REMATCH[2]}
else
        echo "Failed to extract ordinal from hostname $HOST"
        exit 1
fi

BROKER_ID=$((ORD))

cat /tmp/kafka/server.properties.template | sed "s/{{zookeeper.connect}}/$ZK/g" | sed "s/-broker.id-/$BROKER_ID/g"  > /etc/kafka/server.properties

KAFKA_OPTS="$KAFKA_OPTS -javaagent:/opt/jmx_prometheus/jmx_prometheus_javaagent.jar=7071:/etc/jmx_exporter/kafka-jmx-exporter.yml" kafka-server-start.sh /etc/kafka/server.properties

