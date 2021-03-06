#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
cd /tmp
while ! wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb; do
    sleep 1
done
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install -y puppet puppetmaster-passenger hiera vim libssl-dev
cp -r /vagrant/conf/master/*/ /
cd /etc/puppet/modules
puppet module install puppetlabs-concat
puppet module install puppetlabs-apt
puppet module install puppetlabs-stdlib
puppet module install puppetlabs-apache
puppet module install puppetlabs-mysql
puppet module install puppetlabs-puppetdb
puppet module install nibalizer-puppetboard
puppet module install dalen-puppetdbquery
puppet module install jfryman-nginx
puppet module install nanliu-staging
puppet module install justinclayton-serf
chmod -R guo+r nginx
puppet resource service puppet ensure=running enable=true
