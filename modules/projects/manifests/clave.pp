class projects::clave {
  include nodejs
  include arduino

  $home = '/Users/${::boxen_user}/'
  $srcdir = '${home}/src'

  repository { '${srcdir}/clave':
      source => 'git@github.com:apotact/clave',
      path => '/Users/${::boxen_user}/src/clave',
    }
}
