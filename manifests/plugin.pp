# Public: Manage Vagrant Plugins
#
# Examples
#
#   vagrant::plugins { 'vagrant-aws':
#     ensure => present,
#   }

define vagrant::plugin (
  $ensure  = present,
  $license = undef,
) {
  require 'vagrant'

  if $ensure == present {
    if $license {
      $lic_file = "${name}.lic"

      file { $lic_file:
        path   => "${::vagrant::libdir}/${lic_file}",
        source => $license,
      }
      exec { "vagrant_plugin_license_${name}":
        command     => "vagrant plugin license ${name} ${::vagrant::libdir}/${lic_file}",
        require     => File[$lic_file],
        subscribe   => Exec["vagrant_plugin_install_${name}"],
        refreshonly => true,
      }
    }

    exec { "vagrant_plugin_install_${name}":
      command => "vagrant plugin install ${name}",
      unless  => "vagrant plugin list | grep ${name}",
    }
  } else {
    exec { "vagrant_plugin_uninstall_${name}":
      command => "vagrant plugin uninstall ${name}",
      onlyif  => "vagrant plugin list | grep ${name}",
    }
  }
}
