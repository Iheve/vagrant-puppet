class d2si::profile::nginx_loadbalancer {
    include nginx

    nginx::resource::vhost { 'appli':
        server_name => hiera('nginx::ressource::vhost::server_name'),
        proxy       => 'http://farm',
    }

    concat {"/etc/nginx/conf.d/farm-upstream.conf":
        ensure  => present,
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

    concat::fragment {'upstream_header':
        target  => "/etc/nginx/conf.d/farm-upstream.conf",
        content => "upstream farm {\n",
        order  => "01",
    }

    concat::fragment {'upstream_footer':
        target  => "/etc/nginx/conf.d/farm-upstream.conf",
        content => "}\n",
        order  => "03",
    }

    Concat::Fragment <<| |>>


    #nginx::resource::upstream { 'farm':
    #    ensure  => present,
    #    members => hiera('nginx::resource::upstream::members'),
    #}
}
