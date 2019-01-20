FROM rahimre/openjdk:8-jdk

ENV HADOOP_VERSION  2.7.3 
ENV HADOOP_HOME        /opt/hadoop
ENV HADOOP_OPTS        -Djava.library.path=$HADOOP_HOME/lib/native
ENV PATH        $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

RUN DEBIAN_FRONTEND=noninteractive   
ADD http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz hadoop-$HADOOP_VERSION.tar.gz
RUN tar xvf hadoop-$HADOOP_VERSION.tar.gz && \
    rm /hadoop-$HADOOP_VERSION.tar.gz && \
    mv hadoop-$HADOOP_VERSION $HADOOP_HOME 

RUN useradd -u 9000 -m hdfs

RUN mkdir /data
RUN chown -R hdfs /data


COPY namenode.sh $HADOOP_HOME/bin/namenode.sh
COPY datanode.sh $HADOOP_HOME/bin/datanode.sh

RUN chmod 755 $HADOOP_HOME/bin/namenode.sh
RUN chmod 755 $HADOOP_HOME/bin/datanode.sh
RUN chown -R hdfs $HADOOP_HOME

RUN mkdir -p /tmp/hdfs/
RUN mkdir -p /tmp/core/

COPY core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

COPY core-site.xml /tmp/core/core-site.xml
COPY hdfs-site.xml /tmp/hdfs/hdfs-site.xml

