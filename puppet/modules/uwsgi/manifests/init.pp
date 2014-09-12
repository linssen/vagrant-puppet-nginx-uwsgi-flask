class uwsgi {

    $params = {
        "uid" => "www-data",
        "gid" => "www-data",
        "socket" => "/tmp/uwsgi.sock",
        "logdate" => "",
        "optimize" => 2,
        "processes" => 2,
        "master" => "",
        "die-on-term" => "",
        "logto" => "/var/log/uwsgi.log",
        "chdir" => "/var/www/${hostname}.${domain}/src",
        "module" => "app",
        "callable" => "app",
    }

    package { "upstart":
        ensure => installed,
    }
    package { "uwsgi":
        ensure => installed,
        provider => pip,
        require => [Class["python::packages"], Package["upstart"]],
    }
    file { "/etc/init/uwsgi.conf":
        ensure => present,
        owner => "root",
        group => "root",
        mode => "0644",
        content => template("uwsgi/uwsgi.conf.erb"),
        require => Package["uwsgi"],
    }
    file { "/var/log/uwsgi.log":
        ensure => present,
        owner => "www-data",
        group => "www-data",
        mode => "0755",
        require => User["www-data"],
    }
    service { "uwsgi":
        ensure => running,
        provider => upstart,
        enable => true,
        hasrestart => false,
        hasstatus => false,
        require => [File["/etc/init/uwsgi.conf"], File["/var/log/uwsgi.log"]],
    }
}
