# Public: Installs Vagrant 1.3.3
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    ensure   => installed,
    source   => 'http://files.vagrantup.com/packages/0ac2a87388419b989c3c0d0318cc97df3b0ed27d/Vagrant-1.3.4.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
