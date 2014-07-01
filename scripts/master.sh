#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
apt-get update
apt-get install -y puppet puppetmaster-passenger vim
cp /vagrant/conf/puppet.conf.master /etc/puppet/puppet.conf
cp /vagrant/conf/site.pp /etc/puppet/manifests/
