class projects::clave {
  include nodejs
  include arduino

  $home = '/Users/${::boxen_user}/'
  $srcdir = '${home}/src'
  $clave = '${srcdir}/clave'

  repository { '${clave}':
      source => 'git@github.com:apotact/clave',
      path => '/Users/${::boxen_user}/src/clave',
    }
}
