case $::hostname {
    'puppet': {
        $role = 'puppetmaster'
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
