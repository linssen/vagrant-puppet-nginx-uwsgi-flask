class nginx {
    package { 'nginx':
        ensure => present,
        before => File['/etc/nginx/sites-available/default'],
    }
    file { '/etc/nginx/sites-available/default':
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '640',
        content => template('nginx/default_site.erb'),
    }
    service { 'nginx':
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
        subscribe => File['/etc/nginx/sites-available/default'],
    }
}
