node default {
    exec { 'apt-update':
      command => '/usr/bin/apt-get update',
    }

    Exec["apt-update"] -> Package <| |>

    include users
    include nginx
    include python
    include uwsgi
    include utils
}
