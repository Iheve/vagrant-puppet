#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
apt-get update
apt-get install -y puppet puppetmaster-passenger vim
cp /vagrant/conf/puppet.conf /etc/puppet/
cp /vagrant/conf/site.pp /etc/puppet/manifests/
