 #!/bin/bash
###

export namespace=analytics

sudo rm -rf /tmp/*

kubectl delete namespace analytics

kubectl delete pv zk-0
kubectl delete pv zk-1
kubectl delete pv zk-2
kubectl delete pv kafka-0
kubectl delete pv kafka-1
kubectl delete pv kafka-2
kubectl delete pv sm-0
kubectl delete pv sw-0
kubectl delete pv sw-1
kubectl delete pv sw-2
kubectl delete pv nn-0
kubectl delete pv dn-0
kubectl delete pv dn-1
kubectl delete pv dn-2
kubectl delete pv zp-0

