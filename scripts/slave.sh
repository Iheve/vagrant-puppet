#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
cd /tmp
while ! wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb; do
    sleep 1
done
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install --no-install-recommends -y puppet vim
cp -r /vagrant/conf/agent/*/ /
puppet resource service puppet ensure=running enable=true
