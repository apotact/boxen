class people::sid::dotfiles {

  $home  = "/Users/${::boxen_user}"
  $vim   = '${home}/.vim'

  file { "${home}/.vimrc":
      ensure  => link,
      mode    => '0644',
      target  => "${vim}/.vimrc",
      require => Repository["${vim}"],
    }

  file { $vim:
    ensure  => directory
  }

  repository { $vim:
    source  => 'pfista/.vim',
    require => File[$vim]
  }

}
