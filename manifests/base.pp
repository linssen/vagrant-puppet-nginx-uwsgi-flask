exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
}

include nginx
include software
include python

class nginx {
    package { 'nginx':
        ensure => present,
        before => File['/etc/nginx/sites-available/default']
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
        subscribe => File['/etc/nginx/sites-available/default']
    }
}

class software {
  package { ['git', 'vim', ]:
    ensure => 'installed',
  }
}

class python {
  include python::modules
  package { 'python':
    ensure => installed,
  }
}

class python::modules {
  package { ['python-pip', 'python-dev',]:
    ensure => installed,
  }
}