FROM dckreg:5000/spark:2.1.0

RUN apt-get  update
RUN apt-get install -y python-software-properties 


ENV ZEPPELIN_VERSION      0.8.0
ENV PHOENIX_VERSION       5.0.0-HBase-2.0
ENV ZEPPELIN_HOME         /opt/zeppelin
ENV PATH               $PATH:$ZEPPELIN_HOME/bin

RUN wget http://apache.cs.utah.edu/zeppelin/zeppelin-$ZEPPELIN_VERSION/zeppelin-$ZEPPELIN_VERSION-bin-all.tgz 

RUN tar -zxf /zeppelin-$ZEPPELIN_VERSION-bin-all.tgz -C /opt/ && \
    ln -s /opt/zeppelin-$ZEPPELIN_VERSION-bin-all $ZEPPELIN_HOME && \
    rm /zeppelin-$ZEPPELIN_VERSION-bin-all.tgz

RUN wget http://apache.cs.utah.edu/phoenix/apache-phoenix-$PHOENIX_VERSION/bin/apache-phoenix-$PHOENIX_VERSION-bin.tar.gz   && \
    tar -zxf apache-phoenix-$PHOENIX_VERSION-bin.tar.gz && \
    rm apache-phoenix-$PHOENIX_VERSION-bin.tar.gz
RUN mv apache-phoenix-$PHOENIX_VERSION-bin/phoenix-${PHOENIX_VERSION}-client.jar / && \
    rm -fr apache-phoenix-$PHOENIX_VERSION-bin/

RUN cp /phoenix*.jar $ZEPPELIN_HOME/interpreter/jdbc/
