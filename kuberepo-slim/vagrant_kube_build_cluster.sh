#!/bin/bash

####
export mgmt_user=vagrant
export apiserver_count=1
export prometheus_retention=15d
export domain=10.0.15.10.nip.io
####

source ./version.sh.1.11.1

ansible-playbook -i local-kube-inventory.ini  step-1-kube-docker-registry.yml 

./step-2-kube-docker.sh


ansible-playbook -i local-kube-inventory.ini step-3-kube-cluster.yml \
   -e kubelet_version=${kubelet_version} \
   -e kubectl_version=${kubectl_version} \
   -e kubernetes_cni_version=${kubernetes_cni_version} \
   -e kube_docker_version=${kube_docker_version} \
   -e kubedns_version=${kubedns_version} \
   -e weave_kube_version=${weave_kube_version} \
   -e kubernetes_dashboard_version=${kubernetes_dashboard_version} \
   -e calico_node=${calico_node} \
   -e calico_cni=${calico_cni} \
   -e calico_kube_policy_controller=${calico_kube_policy_controller} \
   -e interface=${interface} \
   -e mgmt_user=${mgmt_user} \
   -e apiserver_count=${apiserver_count}

sleep 30

ansible-playbook -i local-kube-inventory.ini step-3-kube-adm-user.yml

sleep 15

mkdir -p /var/tmp/addon/
rm /var/tmp/addon/*

ansible-playbook -i local-kube-inventory.ini  step-4-kube-addon.yml \
   -e kube_docker_version=${kube_docker_version} \
   -e kubedns_version=${kubedns_version} \
   -e weave_kube_version=${weave_kube_version} \
   -e kubernetes_dashboard_version=${kubernetes_dashboard_version} \
   -e prometheus_version=${prometheus_version} \
   -e calico_node=${calico_node} \
   -e calico_cni=${calico_cni} \
   -e calico_kube_policy_controller=${calico_kube_policy_controller} \
   -e domain=${domain} \
   -e helm_version=${helm_version} 

ansible-playbook -i local-kube-inventory.ini  step-5-kube-addon.yml \
   -e nginx_ingress_controller_version=${nginx_ingress_controller_version}  \
   -e prometheus_version=${prometheus_version} \
   -e prometheus_retention=${prometheus_retention} \
   -e domain=${domain} \
   -e grafana_version=${grafana_version} 

kubectl apply -f /var/tmp/addon/kubernetes-dashboard-ingress.yaml
