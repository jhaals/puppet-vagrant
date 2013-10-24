# Public: Installs Vagrant 1.3.5
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant_1_3_5':
    ensure   => installed,
    source   => 'http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/Vagrant-1.3.5.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
