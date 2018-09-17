#!/bin/bash


####
export mgmt_user=vagrant
export apiserver_count=1
export prometheus_retention=15d
export domain=k8t.io
####

source ./version.sh.1.11.1


mkdir -p /var/tmp/addon/
rm /var/tmp/addon/*


ansible-playbook -i local-kube-inventory.ini  step-5-kube-addon.yml \
   -e nginx_ingress_controller_version=${nginx_ingress_controller_version}  \
   -e prometheus_version=${prometheus_version} \
   -e prometheus_retention=${prometheus_retention} \
   -e domain=${domain} \
   -e grafana_version=${grafana_version} 

#ansible-playbook haproxy.yml -i local-kube-inventory.ini

kubectl apply -f /var/tmp/addon/kubernetes-dashboard-ingress.yaml

