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
    package {'git':
        ensure  => present,
    }->
    class { 'puppetboard':
        manage_virtualenv => true,
    }
    # Configure Apache on this server
    class { 'apache': }
    class { 'apache::mod::wsgi': }
    # Configure Puppetboard
    # Access Puppetboard through pboard.example.com
    class { 'puppetboard::apache::vhost':
        vhost_name => 'pboard',
        port       => 80,
    }
}
