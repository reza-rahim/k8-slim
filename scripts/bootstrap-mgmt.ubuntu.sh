#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
sudo apt-get update
sudo apt-get -y install ansible

sudo apt-get -y install python-pip python-dev

sudo apt-get -y install git
sudo git config --global user.name "Reza Rahim"


cp -a /vagrant/scripts/id_rsa /home/vagrant/.ssh/id_rsa
cat  /vagrant/scripts/authorized_keys >> /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

chown -R vagrant:vagrant /home/vagrant/.ssh/authorized_keys

cat >> /home/vagrant/.ssh/config <<EOL
Host *
  StrictHostKeyChecking no
EOL

# configure hosts file for our internal network defined by Vagrantfile
cat > /etc/hosts <<EOL

# vagrant environment nodes
127.0.0.1   localhost
10.0.15.10  mgmt logserver dckreg
EOL

cat > /home/vagrant/.gitconfig <<EOL
[user]
        name = Reza Rahim
        email = rahimre@yahoo.com
EOL
