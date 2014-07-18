class d2si::profile::nginx_loadbalancer {
    include nginx

    $upstream_name = hiera('nginx::resource::upstream::name')
    nginx::resource::vhost { 'appli':
        server_name => hiera('nginx::ressource::vhost::server_name'),
        proxy       => "http://$upstream_name",
    }

}
