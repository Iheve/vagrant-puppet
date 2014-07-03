class d2si::profile::nginx_loadbalancer {
    include nginx

    nginx::resource::vhost { 'appli':
        proxy   => 'http://farm',
    }

    nginx::resource::upstream { 'farm':
        ensure  => present,
        members => [
            '192.168.50.100:80',
            '192.168.50.101:80',
        ],
    }
}