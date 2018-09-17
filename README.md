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

- add following entry top /etc/hosts

```bash
10.0.15.10 dashboard.k8t.io

```

- install node.js

```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo sh
sudo apt-get install -y nodejs
```

- install Java and Maven

```bash
sudo apt install -y openjdk-8-jdk
sudo apt install -y maven
```
