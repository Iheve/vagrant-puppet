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
        content => template('index.html.erb'),
    }
}
