FROM rahimre/openjdk:8-jdk

ENV KAFKA_SCALA_VERSION   2.11
ENV KAFKA_VERSION   0.10.1.1
ENV KAFKA_HOME  /opt/kafka_$KAFKA_SCALA_VERSION-$KAFKA_VERSION
ENV PATH  $PATH:$KAFKA_HOME/bin


RUN  wget -q https://archive.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$KAFKA_SCALA_VERSION-$KAFKA_VERSION.tgz  -O /tmp/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz && \
    tar xfz /tmp/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -C /opt && \
    rm /tmp/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz 

RUN mkdir /etc/jmx_exporter
COPY kafka-jmx-exporter.yml /etc/jmx_exporter/kafka-jmx-exporter.yml

RUN useradd -u 9004 -m kafka

COPY kafka-start.sh $KAFKA_HOME/bin/

CMD chmod 755 $KAFKA_HOME/bin/kafka-start.sh

CMD mkdir /etc/kafka

COPY server.properties.template /etc/kafka/

