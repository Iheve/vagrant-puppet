class d2si::profile::base{

    package {unzip:
        ensure  => present,
    }->
    user {serf:
        name    => '_serf',
        ensure  => present,
    }->
    class { serf:
        version => '0.6.3',
        init_script_url => "https://raw.githubusercontent.com/hashicorp/serf/master/ops-misc/debian/serf.upstart",
        bin_dir => '/usr/bin',
        config_hash => {
            interface   => 'eth1',
            discover    => 'puppetnodes',
        }
    }
}
