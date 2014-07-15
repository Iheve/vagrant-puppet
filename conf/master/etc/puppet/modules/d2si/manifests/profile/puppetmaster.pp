class d2si::profile::puppetmaster{
    host { 'puppetdb.d2sim7.loc':
        ensure => 'present',
        ip     => '192.168.50.5',
        target => '/etc/hosts',
    }->
    # Configure the puppet master to use puppetdb
    class { 'puppetdb::master::config':
        puppet_service_name => 'apache2',
        puppetdb_server => 'puppetdb.d2sim7.loc',
    }
}
