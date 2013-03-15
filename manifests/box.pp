# Public: Manage Vagrant Boxes
#
# Examples
#
#   vagrant::box { 'centos-63-x64':
#     ensure => present,
#     url    => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box',
#   }

define vagrant::box (
  $ensure   = present,
  $url      = undef,
  $provider = 'virtualbox',
  $timeout  = 0, # file download can take a while.
) {
  require 'vagrant'

  if $ensure == present {
    if $url {
      exec { "vagrant_box_add_${name}":
        command => "vagrant box add ${name} ${url} --provider=${provider}",
        unless  => "vagrant box list | grep ${name}",
        timeout => $timeout,
      }
    } else {
      fail ("vagrant::box ${name} require url")
    }
  } else {
    exec { "vagrant_box_remove_${name}":
      command => "vagrant box remove ${name} ${provider}",
      onlyif  => "vagrant box list | grep ${name}",
    }
  }
}
