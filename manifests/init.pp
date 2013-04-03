# Public: Installs Vagrant 1.1.4
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    ensure   => installed,
    source   => 'http://files.vagrantup.com/packages/64e360814c3ad960d810456add977fd4c7d47ce6/Vagrant.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
