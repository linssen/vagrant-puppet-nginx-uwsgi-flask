class users {
    group { 'www-data':
        ensure => present,
    }

    user { 'www-data':
        ensure => present,
        groups => ['www-data'],
        membership => minimum,
        shell => "/bin/bash",
        require => Group['www-data']
    }
}
