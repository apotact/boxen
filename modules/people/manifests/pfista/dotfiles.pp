class people::pfista::dotfiles {

  $home  = "/Users/${::boxen_user}"
  $vim   = "${home}/.vim"
  $dotfiles = "${home}/.dotfiles"

  file { "${home}/.vimrc":
      ensure  => link,
      mode    => '0644',
      target  => "${vim}/.vimrc",
      require => Repository["${vim}"],
    }

  repository { $vim:
    source  => 'pfista/.vim',
    require => File[$vim],
  }

  file { "${vim}/backup":
    ensure  => directory,
    require => File["${vim}"],
  }

  file { $vim:
    ensure  => directory,
  }

  file { "${home}/.gitconfig":
    ensure => link,
    mode => '0644',
    target => "${dotfiles}/.gitconfig",
    require => Repository["${dotfiles}"],
  }

  repository { $dotfiles: 
    source => 'pfista/.dotfiles',
    require => File[$dotfiles],
  }

  file { $dotfiles:
    ensure => directory,
  }

}
