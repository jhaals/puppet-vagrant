# Public: Installs Vagrant 1.2.2
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    ensure   => installed,
    source   => 'http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/Vagrant-1.2.2.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
