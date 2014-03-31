class utils {
  package { ['git', 'vim', ]:
    ensure => installed,
  }
}
