#!/bin/bash

cp /tmp/hbase-site//hbase-site.xml  $HBASE_HOME/conf/hbase-site.xml
cp /tmp/hbase-env/hbase-env.sh  $HBASE_HOME/conf/hbase-env.sh

HOST=$(hostname -f)

if [ $MODE = "master" ]; then
	sudo -Eu hdfs $HADOOP_HOME/bin/hdfs dfs  -mkdir  -p /user/hbase
        sudo -Eu hdfs $HADOOP_HOME/bin/hdfs dfs  -chown hbase /user/hbase
	sudo -Eu hbase $HBASE_HOME/bin/hbase  master start
else
        sed -i -e "s/-HOSTNAME-/$HOST/"  $HBASE_HOME/conf/hbase-site.xml
	sudo -Eu hbase $HBASE_HOME/bin/hbase  regionserver start
fi 
