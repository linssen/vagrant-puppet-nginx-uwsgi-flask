include nginx
include software
include python
include uwsgi

exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
}

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

class nginx {
    package { 'nginx':
        ensure => present,
        before => File['/etc/nginx/sites-available/default'],
        require => Exec['apt-get update'],
    }
    file { '/etc/nginx/sites-available/default':
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '640',
        content => template('/vagrant/templates/default_site.erb'),
    }
    service { 'nginx':
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
        subscribe => File['/etc/nginx/sites-available/default'],
    }
}

class software {
  package { ['git', 'vim', ]:
    require => Exec['apt-get update'],
    ensure => installed,
  }
}

class python {
    include python::packages

    package { 'python':
        ensure => installed,
        require => Exec['apt-get update'],
    }
}

class python::packages {
    $apt = ['python-dev', 'build-essential', 'python-pip', ]
    $pip = ['flask', ]

    package { $apt:
        require => Class['python'],
        ensure => installed,
    }

    package { $pip:
        require => Class['python'],
        ensure => installed,
        provider => pip,
    }
}

class uwsgi {
    package { 'upstart':
        ensure => installed,
        require => Exec['apt-get update'],
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
        source => '/vagrant/templates/uwsgi.conf',
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