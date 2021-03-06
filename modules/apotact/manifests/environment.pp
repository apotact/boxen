# modules/apotact/manifests/environment.pp

 class apotact::environment {

  include java
  include chrome
   
  include iterm2::dev
  include iterm2::colors::solarized_dark

  include osx::software_update
  include osx::finder::empty_trash_securely
  include osx::keyboard::capslock_to_control
  class { 'osx::global::key_repeat_delay':
    delay => 10,
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2,
    }

  include dropbox
  include spotify
  include arduino
  include vlc
  include wget
  include spectacle
  include zsh

  class { 'intellij':
    edition => 'community',
    version => '14.1.1',
  }

  include brewcask

  package { 'slack': 
    provider => 'brewcask',
    ensure => present,
  }


  package { 'ssh-copy-id':
    ensure => present,
  }

  package { 'vim':
    ensure => present,
  }

  include projects::all

  package { 'gradle':
    ensure => present,
 }
}
