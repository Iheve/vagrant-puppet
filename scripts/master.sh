#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
cd /tmp
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install -y puppet puppetmaster-passenger hiera vim libssl-dev
#gem install puppet-module
cd /etc/puppet/modules
puppet module install nkadithya31-lamp
puppet module install puppetlabs-concat
puppet module install puppetlabs-apt
puppet module install puppetlabs-stdlib
puppet module install puppetlabs-apache
puppet module install jfryman-nginx
chmod -R guo+r nginx
cp -r /vagrant/conf/master/*/ /
