# k8-slim

- Open Vagrantfile file, set the memory if needed

```bash
13         vb.memory = "8096"
```

```bash
vagrant up
vagrant ssh 

cd /vagrant/kuberepo-slim/

./vagrant_kube_build_cluster.sh 

```
add following entry top /etc/hosts

10.0.15.10 dashboard.k8t.io
