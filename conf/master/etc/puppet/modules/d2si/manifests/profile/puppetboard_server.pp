class d2si::profile::puppetboard_server {
    host { 'puppetdb.d2sim7.loc':
        ensure => 'present',
        ip     => '192.168.50.5',
        target => '/etc/hosts',
    }
    class { 'puppetboard':
        manage_git        => true,
        manage_virtualenv => true,
        puppetdb_host => 'puppetdb.d2sim7.loc',
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
