kubectl apply -f redis-storage.yaml

kubectl create namespace redis
kubectl apply -n redis -f rbac.yaml
kubectl apply -n redis -f crd.yaml
kubectl apply -n redis -f operator.yaml
kubectl apply -n redis -f redis-enterprise-cluster.yaml
kubectl apply -n redis -f ingress.yaml 
