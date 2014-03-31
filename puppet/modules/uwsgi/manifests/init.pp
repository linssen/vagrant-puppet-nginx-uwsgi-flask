class uwsgi {
    package { 'upstart':
        ensure => installed,
    }
    package { 'uwsgi':
        ensure => installed,
        provider => pip,
        require => [Class['python::packages'], Package['upstart']],
    }
    file { '/etc/init/uwsgi.conf':
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0644',
        source => 'puppet:///modules/uwsgi/uwsgi.conf',
        require => Package['uwsgi'],
    }
    file { '/var/log/uwsgi.log':
        ensure => present,
        owner => 'www-data',
        group => 'www-data',
        mode => '0755',
        require => User['www-data'],
    }
    service { 'uwsgi':
        ensure => running,
        provider => upstart,
        enable => true,
        hasrestart => false,
        hasstatus => false,
        require => [File['/etc/init/uwsgi.conf'], File['/var/log/uwsgi.log']],
    }
}
