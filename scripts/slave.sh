#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
cd /tmp
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install -y puppet vim
cp -r /vagrant/conf/agent/*/ /
puppet resource service puppet ensure=running enable=true
