case $::hostname {
    'puppet': {
        $role = 'puppetmaster'
    }
    puppetdb: {
        $role = 'puppetdb'
    }
    puppetboard: {
        $role = 'puppetboard'
    }
    'front': {
        $role = 'front_end'
    }
    sqlsrv: {
        $role = 'sql_server'
    }
    /^node\d$/: {
        $role = 'web_server'
    }
}

include d2si
