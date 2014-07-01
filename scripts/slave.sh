#! /bin/bash
cat /vagrant/conf/hosts >> /etc/hosts
apt-get update
apt-get install -y puppet vim
puppet resource cron puppet-agent ensure=present user=root minute="*/1" command='/usr/bin/puppet agent --onetime --no-daemonize --splay'
