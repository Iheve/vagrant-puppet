class d2si::profile::puppetmaster_puppetdb {
    host { 'puppet.d2sim7.loc':
        ensure => 'present',
        ip     => '127.0.0.1',
        target => '/etc/hosts',
    }->
    # Configure puppetdb and its underlying database
    class { 'puppetdb': }
    ->
    # Configure the puppet master to use puppetdb
    class { 'puppetdb::master::config':
        puppet_service_name => 'apache2',
    }


    class { 'puppetboard':
            manage_git        => 'latest',
            manage_virtualenv => 'latest',
    }
}
