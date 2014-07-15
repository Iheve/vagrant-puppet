class d2si::profile::apache_server {
    include apache

    apache::vhost { 'appli':
        vhost_name  => '*',
        port        => '80',
        docroot     => '/var/www',
    }

    file { '/var/www/index.html':
        ensure  => present,
        mode    => 0644,
        require => package['apache2'],
        content => template('d2si/index.html.erb'),
    }

    @@concat::fragment{"upstream-$fqdn":
        target  => "/etc/nginx/conf.d/farm-upstream.conf",
        content => "server $::hostname:80 fail_timeout=10s\n",
        order   => "02",
    }

}
