

git clone https://rerahim@bitbucket.org/rerahim/kuberepo.git

#basic auth

htpasswd -c /tmp/auth admin
kubectl create secret generic basic-auth -n kube-system --from-file=/tmp/auth
kubectl create secret generic basic-auth -n monitoring --from-file=/tmp/auth
sudo apt-get update
sudo apt-get install apache2-utils

# README #

curl -k https://10.0.15.9:443 --header "Authorization: Bearer RwGrYX7122SzpBR7w2hy0LqvET8ZLJN"

kubectl set subject clusterrolebinding cluster-admin --group=system:cluster-admin --user=kube-admin
kubectl set subject clusterrolebinding system:node --group=system:nodes --user=kube-node

###access kube dashbaord
#kubectl -n kube-system port-forward $(kubectl -n kube-system get pod -l app=kubernetes-dashboard -o jsonpath='{.items[0].metadata.name}' ) 9010:9090 &
#kubectl -n monitoring port-forward $(kubectl -n monitoring get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}' ) 9020:9090 &
#kubectl -n monitoring port-forward $(kubectl -n monitoring get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}' ) 9030:3000 &

### ssh to vagrant
ssh vagrant@10.0.15.10  -L 9010:localhost:9010 
ssh node1 -L 9010:localhost:9010

## set laptop /etc/hosts
127.0.0.1 dashboard.kube.local
127.0.0.1 prometheus.kube.local
127.0.0.1 grafana.kube.local

###nginx mgmt
http://10.0.15.11:9011/nginx_status



####

kubectl run my-curl --rm -i --tty -n istio-test --image tutum/curl -- sh
kubectl run my-ping --rm -i --tty  --image willfarrell/ping -- sh

