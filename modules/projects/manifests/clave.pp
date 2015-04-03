class projects::clave {
  include nodejs
  include arduino

  $home = '/Users/${::boxen_user}'
  $srcdir = '${home}/code'

  repository { '${srcdir}/clave':
      source => 'git@github.com:apotact/clave',
      path => "$srcdir/clave",
    }
}
