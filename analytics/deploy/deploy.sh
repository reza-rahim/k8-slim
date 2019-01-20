rm /var/tmp/analytics/*
export domain=k8t.io
export namespace=analytics
kubectl create namespace ${namespace}

kubectl create  secret generic basic-auth -n ${namespace}  --from-file=/tmp/auth

ansible-playbook -i inventory.ini -e namespace=${namespace} config.yml

ansible-playbook -i inventory.ini -e namespace=${namespace}  -e storage_class=zk-storage zookeeper.yml

sleep 30
ansible-playbook -i inventory.ini -e namespace=${namespace} -e storage_class=kafka-storage kafka.yml


sleep 30
ansible-playbook -i inventory.ini -e namespace=${namespace} -e domain=${domain} -e storage_class=nn-storage hdfs-nn.yml

sleep 30
#ansible-playbook -i inventory.ini -e namespace=${namespace} -e storage_class=dn-storage hdfs-dn.yml

#

sleep 30
ansible-playbook -i inventory.ini -e namespace=${namespace} hbase-dn-rs.yml

sleep 30
ansible-playbook -i inventory.ini -e domain=${domain} -e namespace=${namespace} hbase-master.yml

sleep 30
ansible-playbook -i inventory.ini -e namespace=${namespace} -e domain=${domain} spark-master.yml


sleep 30
ansible-playbook -i inventory.ini -e namespace=${namespace} -e domain=${domain} spark-worker.yml


sleep 30
ansible-playbook -i inventory.ini -e namespace=${namespace} -e domain=${domain} pipeline.yml

ansible-playbook -i inventory.ini -e namespace=${namespace} -e domain=${domain} zeppelin.yml

ansible-playbook -i inventory.ini -e namespace=${namespace} -e domain=${domain} noderestapi.yml

kubectl exec -it -n ${namespace} kafka-0 -- bash -c  "kafka-topics.sh --create --zookeeper zk-0.zk:2181 --replication-factor 1 --partitions 1 --topic message"

kubectl exec -it -n ${namespace} hm-0 -- bash -c "echo \"CREATE TABLE SENSOR ( FT UNSIGNED_TIME NOT NULl ,ID UNSIGNED_INT NOT null ,M UNSIGNED_INT CONSTRAINT PK PRIMARY KEY (FT DESC,ID) ) SALT_BUCKETS=2,UPDATE_CACHE_FREQUENCY='NEVER'; \"| sqlline.py zk-0.zk "


#Zeppline
# on jdbc inerpreter
#default.driver : org.apache.phoenix.jdbc.PhoenixDriver
#default.url : jdbc:phoenix:zk-0.zk:/hbase

# select * from sensor


#curl -H "Content-Type: application/json" -k -X POST -d '{"msg":"2017-03-08 13:50:20.365,3,56"}' https://npi.k8t.io:9020/api

#curl -H "Content-Type: application/json" -X POST -d '{"msg":"2017-03-08 13:50:19.365,3,56"}'   http://npi.sloppytiger.com:9010/api
