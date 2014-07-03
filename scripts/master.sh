#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
apt-get update
apt-get install -y puppet puppetmaster-passenger vim libssl-dev
gem install puppet-module
cd /etc/puppet/modules
puppet module install nkadithya31-lamp
puppet module install puppetlabs-concat
puppet module install puppetlabs-apt
puppet module install puppetlabs-stdlib
puppet module install puppetlabs-apache
puppet module install jfryman-nginx
chmod -R guo+r nginx
cp -r /vagrant/conf/master/etc/ /
