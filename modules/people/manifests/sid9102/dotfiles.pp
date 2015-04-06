class people::sid9102::dotfiles {

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
    require => File[$vim]
  }

  file { "${vim}/backup":
    ensure  => directory,
    require => File["${vim}"],
  }

  file { $vim:
    ensure  => directory,
  }

}
