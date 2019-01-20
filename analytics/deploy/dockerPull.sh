
sudo docker pull rahimre/zookeeper:3.4.8
sudo docker tag rahimre/zookeeper:3.4.8 dckreg:5000/zookeeper:3.4.8
sudo docker push dckreg:5000/zookeeper:3.4.8

#kafka
sudo docker pull rahimre/kafka:0.10.1.1
sudo docker tag rahimre/kafka:0.10.1.1 dckreg:5000/kafka:0.10.1.1
sudo docker push dckreg:5000/kafka:0.10.1.1


sudo docker pull rahimre/hadoop:2.7.3
sudo docker tag rahimre/hadoop:2.7.3 dckreg:5000/hadoop:2.7.3
sudo docker push dckreg:5000/hadoop:2.7.3
#

sudo docker pull rahimre/hbase:2.0.0
sudo docker tag rahimre/hbase:2.0.0 dckreg:5000/hbase:2.0.0
sudo docker push dckreg:5000/hbase:2.0.0

sudo docker pull rahimre/spark:2.1.0
sudo docker tag rahimre/spark:2.1.0 dckreg:5000/spark:2.1.0
sudo docker push dckreg:5000/spark:2.1.0

sudo docker pull rahimre/pipeline:0.0.1
sudo docker tag rahimre/pipeline:0.0.1 dckreg:5000/pipeline:0.0.1
sudo docker push dckreg:5000/pipeline:0.0.1

sudo docker pull rahimre/zeppelin:0.8.0
sudo docker tag rahimre/zeppelin:0.8.0 dckreg:5000/zeppelin:0.8.0
sudo docker push dckreg:5000/zeppelin:0.8.0

sudo docker pull rahimre/noderestapi:1.0
sudo docker tag rahimre/noderestapi:1.0 dckreg:5000/noderestapi:1.0
sudo docker push dckreg:5000/noderestapi:1.0

