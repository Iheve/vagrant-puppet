class d2si::profile::nginx_loadbalancer {
    include nginx

    nginx::resource::vhost { 'appli':
        server_name => hiera('nginx::ressource::vhost::server_name'),
        proxy       => 'http://farm',
    }

    nginx::resource::upstream { 'farm':
        ensure  => present,
        members => hiera('nginx::resource::upstream::members'),
    }
}
