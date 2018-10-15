ssh dckreg sudo docker pull  gcr.io/google_containers/etcd-amd64:${etcd_version} 
ssh dckreg sudo docker tag   gcr.io/google_containers/etcd-amd64:${etcd_version} dckreg:5000/etcd-amd64:${etcd_version}
ssh dckreg sudo docker push  dckreg:5000/etcd-amd64:${etcd_version}

ssh dckreg sudo docker pull  gcr.io/google_containers/kube-apiserver-amd64:${kube_docker_version} 
ssh dckreg sudo docker tag   gcr.io/google_containers/kube-apiserver-amd64:${kube_docker_version} dckreg:5000/kube-apiserver-amd64:${kube_docker_version}
ssh dckreg sudo docker push  dckreg:5000/kube-apiserver-amd64:${kube_docker_version}

ssh dckreg sudo docker pull  gcr.io/google_containers/kube-controller-manager-amd64:${kube_docker_version} 
ssh dckreg sudo docker tag   gcr.io/google_containers/kube-controller-manager-amd64:${kube_docker_version} dckreg:5000/kube-controller-manager-amd64:${kube_docker_version}
ssh dckreg sudo docker push  dckreg:5000/kube-controller-manager-amd64:${kube_docker_version}

ssh dckreg sudo docker pull   gcr.io/google_containers/kube-scheduler-amd64:${kube_docker_version}
ssh dckreg sudo docker tag   gcr.io/google_containers/kube-scheduler-amd64:${kube_docker_version} dckreg:5000/kube-scheduler-amd64:${kube_docker_version}
ssh dckreg sudo docker push  dckreg:5000/kube-scheduler-amd64:${kube_docker_version}

ssh dckreg sudo docker pull  gcr.io/google_containers/kube-proxy-amd64:${kube_docker_version}
ssh dckreg sudo docker tag   gcr.io/google_containers/kube-proxy-amd64:${kube_docker_version} dckreg:5000/kube-proxy-amd64:${kube_docker_version}
ssh dckreg sudo docker push  dckreg:5000/kube-proxy-amd64:${kube_docker_version}

ssh dckreg sudo docker pull  gcr.io/google_containers/k8s-dns-kube-dns-amd64:${kubedns_version}
ssh dckreg sudo docker tag   gcr.io/google_containers/k8s-dns-kube-dns-amd64:${kubedns_version} dckreg:5000/k8s-dns-kube-dns-amd64:${kubedns_version}
ssh dckreg sudo docker push  dckreg:5000/k8s-dns-kube-dns-amd64:${kubedns_version}

ssh dckreg sudo docker pull  gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:${kubedns_version}
ssh dckreg sudo docker tag   gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:${kubedns_version} dckreg:5000/k8s-dns-dnsmasq-nanny-amd64:${kubedns_version}
ssh dckreg sudo docker push  dckreg:5000/k8s-dns-dnsmasq-nanny-amd64:${kubedns_version}

ssh dckreg sudo docker pull  gcr.io/google_containers/k8s-dns-sidecar-amd64:${kubedns_version}
ssh dckreg sudo docker tag   gcr.io/google_containers/k8s-dns-sidecar-amd64:${kubedns_version} dckreg:5000/k8s-dns-sidecar-amd64:${kubedns_version}
ssh dckreg sudo docker push  dckreg:5000/k8s-dns-sidecar-amd64:${kubedns_version}

ssh dckreg sudo docker pull  weaveworks/weave-kube:${weave_kube_version}
ssh dckreg sudo docker tag   weaveworks/weave-kube:${weave_kube_version} dckreg:5000/weave-kube:${weave_kube_version}
ssh dckreg sudo docker push  dckreg:5000/weave-kube:${weave_kube_version}

ssh dckreg sudo docker pull  weaveworks/weave-npc:${weave_kube_version}
ssh dckreg sudo docker tag   weaveworks/weave-npc:${weave_kube_version} dckreg:5000/weave-npc:${weave_kube_version}
ssh dckreg sudo docker push  dckreg:5000/weave-npc:${weave_kube_version}

ssh dckreg sudo docker pull  quay.io/calico/kube-controllers:${calico_kube_controllers}
ssh dckreg sudo docker tag   quay.io/calico/kube-controllers:${calico_kube_controllers} dckreg:5000/calico/kube-controllers:${calico_kube_controllers}
ssh dckreg sudo docker push  dckreg:5000/calico/kube-controllers:${calico_kube_controllers}

ssh dckreg sudo docker pull  quay.io/calico/cni:${calico_cni}
ssh dckreg sudo docker tag   quay.io/calico/cni:${calico_cni} dckreg:5000/calico/cni:${calico_cni}
ssh dckreg sudo docker push  dckreg:5000/calico/cni:${calico_cni}

ssh dckreg sudo docker pull  quay.io/calico/node:${calico_node}
ssh dckreg sudo docker tag   quay.io/calico/node:${calico_node} dckreg:5000/calico/node:${calico_node}
ssh dckreg sudo docker push  dckreg:5000/calico/node:${calico_node}

ssh dckreg sudo docker pull  gcr.io/google_containers/kubernetes-dashboard-amd64:${kubernetes_dashboard_version}
ssh dckreg sudo docker tag   gcr.io/google_containers/kubernetes-dashboard-amd64:${kubernetes_dashboard_version} dckreg:5000/kubernetes-dashboard-amd64:${kubernetes_dashboard_version}
ssh dckreg sudo docker push  dckreg:5000/kubernetes-dashboard-amd64:${kubernetes_dashboard_version}

ssh dckreg sudo docker pull  quay.io/prometheus/prometheus:${prometheus_version}
ssh dckreg sudo docker tag   quay.io/prometheus/prometheus:${prometheus_version}  dckreg:5000/prometheus:${prometheus_version}
ssh dckreg sudo docker push  dckreg:5000/prometheus:${prometheus_version}

ssh dckreg sudo docker pull  grafana/grafana:${grafana_version}
ssh dckreg sudo docker tag   grafana/grafana:${grafana_version}  dckreg:5000/grafana:${grafana_version}
ssh dckreg sudo docker push  dckreg:5000/grafana:${grafana_version}

ssh dckreg sudo docker pull  quay.io/kubernetes-ingress-controller/nginx-ingress-controller:${nginx_ingress_controller_version}
ssh dckreg sudo docker tag   quay.io/kubernetes-ingress-controller/nginx-ingress-controller:${nginx_ingress_controller_version}  dckreg:5000/nginx-ingress-controller:${nginx_ingress_controller_version}
ssh dckreg sudo docker push  dckreg:5000/nginx-ingress-controller:${nginx_ingress_controller_version}


ssh dckreg sudo docker pull redislabs/operator:${redis_operator_version}
ssh dckreg sudo docker tag  redislabs/operator:${redis_operator_version} dckreg:5000/operator:${redis_operator_version}

ssh dckreg  sudo docker pull redislabs/redis:${redis_bdb_version}
ssh dckreg sudo docker tag   redislabs/redis:${redis_bdb_version} dckreg:5000/redis:${redis_bdb_version}
