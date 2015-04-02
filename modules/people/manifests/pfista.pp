class people::pfista {

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/.dotfiles"
  
  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'pfista/.dotfiles',
    require => File[$my]
  }

  include projects::all

  ################# 

  # Personal osx settings
  osx::recovery_message { 'If this Mac is found, please call 281-703-5539': }
  include osx::global::enable_keyboard_control_access
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::dock::clear_dock
  include osx::finder::no_file_extension_warnings
  include include osx::safari::enable_developer_mode
  class { 'osx::dock::position':
    position => 'right'
  }
  # Make the top right corner start the screen saver and the bottom left corner
  # launch Mission Control
  class { 'osx::dock::hot_corners':
    top_left=> "Start Screen Saver",
  }
  class { 'osx::dock::magnification':
    magnification => false
  }

  include onepassword
  include onepassword::chrome

  class { 'prezto': repo => 'pfista/prezto' }

  package { 'rescuetime': provider => 'brewcask' }

}
