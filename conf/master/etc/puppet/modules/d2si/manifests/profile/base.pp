class d2si::profile::base{

    package {unzip:
        ensure  => present,
    }

    user {serf:
        name    => '_serf',
        ensure  => present,
    }

    class{serf:
        config_hash => hiera_hash(serf::config_hash, {}),
    }

    Class['serf']   <- User['serf']
    Class['serf']   <- Package['unzip']
}
