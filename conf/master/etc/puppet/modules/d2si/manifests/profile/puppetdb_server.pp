class d2si::profile::puppetdb_server {
    host { 'puppetdb.d2sim7.loc':
        ensure => 'present',
        ip     => '127.0.0.1',
        target => '/etc/hosts',
    }->
    # Configure puppetdb and its underlying database
    class { 'puppetdb':
        listen_address => '0.0.0.0',
        ssl_listen_address => '0.0.0.0',
    }
}
