class projects::clave {
  include nodejs
  include arduino

  $home = "/Users/${::boxen_user}"
  $srcdir = "${home}/src"
  $clavedir = "${srcdir}/clave"

  file { "$clavedir":
    path => "$clavedir",
    ensure => directory,
  }

  repository { "$clavedir":
      source => 'apotact/clave',
      path => "$clavedir",
      require => File["$clavedir"],
    }
}
