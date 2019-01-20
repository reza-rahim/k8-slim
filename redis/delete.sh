kubectl delete  namespace redis

kubectl delete -f redis-storage-class.yaml
kubectl delete -f redis-storage.yaml
