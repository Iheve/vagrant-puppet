#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
apt-get update
apt-get install -y puppet vim
cp /vagrant/conf/puppet.conf.agent /etc/puppet/puppet.conf
cp /vagrant/conf/puppet.default /etc/default/puppet
puppet resource service puppet ensure=running enable=true
