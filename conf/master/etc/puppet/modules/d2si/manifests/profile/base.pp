class d2si::profile::base{

    package {"unzip":
        ensure  => present,
    }

    package{"curl":
        ensure  => present,
    }

    user {serf:
        name    => '_serf',
        ensure  => present,
    }

    class{serf:
        config_hash => hiera_hash(serf::config_hash, {}),
    }

    file{'/etc/serf/handlers/join.sh':
        ensure  => 'file',
        content => template('d2si/join.sh.erb'),
        mode    => '755',
    }

    file{'/etc/serf/handlers/leave.sh':
        ensure  => 'file',
        content => template('d2si/leave.sh.erb'),
        mode    => '755',
    }

    Service['serf'] <- File['/etc/serf/handlers/join.sh']
    Service['serf'] <- File['/etc/serf/handlers/leave.sh']
    Class['serf']   <- User['serf']
    Class['serf']   <- Package['unzip']
    Class['serf']   <- Package['curl']
}
