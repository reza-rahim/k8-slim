FROM  rahimre/spark:2.1.0


ENV PHOENIX_HOME   /opt/phoenix
ENV PHOENIX_VERSION 5.0.0-HBase-2.0

RUN wget https://github.com/reza-rahim/spark_jar/raw/master/spark-stream-assembly-0.0.1-SNAPSHOT.jar

RUN wget http://apache.cs.utah.edu/phoenix/apache-phoenix-$PHOENIX_VERSION/bin/apache-phoenix-$PHOENIX_VERSION-bin.tar.gz   && \
    tar -zxf apache-phoenix-$PHOENIX_VERSION-bin.tar.gz && \
    rm apache-phoenix-$PHOENIX_VERSION-bin.tar.gz 
RUN mv apache-phoenix-$PHOENIX_VERSION-bin/phoenix-${PHOENIX_VERSION}-client.jar / && \
    rm -fr apache-phoenix-$PHOENIX_VERSION-bin/


COPY start_pipeline.sh /
