# Public: Installs Vagrant 1.2.1
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    ensure   => installed,
    source   => 'http://files.vagrantup.com/packages/a7853fe7b7f08dbedbc934eb9230d33be6bf746f/Vagrant-1.2.1.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
