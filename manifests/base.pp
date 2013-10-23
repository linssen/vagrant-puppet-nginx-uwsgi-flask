exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
}

class nginx {
    include stdlib

    group { 'puppet':
        ensure => present,
    }

    package { 'nginx':
        ensure => present,
        require => Exec['apt-get update'],
    }

    service { 'nginx':
        ensure => running,
        require => Package['nginx'],
    }
}

class git {
  package { 'git':
    ensure => 'installed',
  }
}

class vim {
  package { 'vim':
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