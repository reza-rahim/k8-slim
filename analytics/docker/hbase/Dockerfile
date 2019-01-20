FROM  rahimre/hadoop:2.7.3

ENV HBASE_VERSION    2.0.0
ENV HBASE_HOME       /opt/hbase

ENV PHOENIX_HOME   /opt/phoenix
ENV PHOENIX_VERSION 5.0.0-HBase-2.0

ENV PATH             $PATH:$HBASE_HOME/bin:$PHOENIX_HOME/bin

RUN DEBIAN_FRONTEND=noninteractive  && \
    wget http://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz   && \
    tar -zxf hbase-$HBASE_VERSION-bin.tar.gz && \
    rm hbase-$HBASE_VERSION-bin.tar.gz && \
    mv hbase-$HBASE_VERSION $HBASE_HOME

RUN wget http://apache.cs.utah.edu/phoenix/apache-phoenix-$PHOENIX_VERSION/bin/apache-phoenix-$PHOENIX_VERSION-bin.tar.gz   && \
    tar -zxf apache-phoenix-$PHOENIX_VERSION-bin.tar.gz && \
    rm apache-phoenix-$PHOENIX_VERSION-bin.tar.gz && \
    mv apache-phoenix-$PHOENIX_VERSION-bin $PHOENIX_HOME

RUN cp $PHOENIX_HOME/phoenix-$PHOENIX_VERSION-server.jar $HBASE_HOME/lib/

RUN useradd -u 9001 -m hbase 

RUN chown -R hbase $HBASE_HOME
RUN chown -R hbase $PHOENIX_HOME


CMD mkdir /etc/jmx_exporter/
COPY hbase-jmx-exporter.yml /etc/jmx_exporter/

COPY hbase-env.sh $HBASE_HOME/conf/hbase-env.sh
COPY starthbase.sh $HBASE_HOME/bin/starthbase.sh

