FROM rahimre/hadoop:2.7.3

ENV SPARK_VERSION     2.1.0 
ENV SPARK_HADOOP_VERSION {{ SPARK_HADOOP_VERSION }}
ENV SBT_VERSION       0.13.13
ENV SPARK_HOME         /opt/spark
ENV PATH               $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SBT_HOME/bin

# Installing Spark for Hadoop
RUN wget  https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz 

RUN tar -zxf /spark-$SPARK_VERSION-bin-without-hadoop.tgz  && \
    mv spark-$SPARK_VERSION-bin-without-hadoop $SPARK_HOME && \
    rm /spark-$SPARK_VERSION-bin-without-hadoop.tgz
    
RUN useradd -u 9002 -m spark 

COPY spark-daemon.sh $SPARK_HOME/sbin/
COPY startspark.sh $SPARK_HOME/sbin/
COPY spark-env.sh $SPARK_HOME/conf/

ENV SPARK_MASTER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_WORKER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

