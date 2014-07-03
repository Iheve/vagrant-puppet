#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
apt-get update
apt-get install -y puppet vim
cp -r /vagrant/conf/agent/etc/ /
puppet resource service puppet ensure=running enable=true
