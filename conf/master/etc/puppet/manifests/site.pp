case $::hostname {
    'front': {
        $role = 'front_end'
    }
    /^node\d$/: {
        $role = 'web_server'
    }
}
