class people::sid9102::applications {

  include projects::all

  # Personal osx settings
  include osx::global::enable_keyboard_control_access
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::finder::no_file_extension_warnings
  include osx::safari::enable_developer_mode

  # Make the top right corner start the screen saver and the bottom left corner
  # launch Mission Control
  class { 'osx::dock::hot_corners':
    top_left => "Start Screen Saver",
  }

  include onepassword
  include onepassword::chrome

  class { 'prezto': 
    repo => 'pfista/prezto'
  }

  package { 'rescuetime': 
    provider => 'brewcask'
  }

}
