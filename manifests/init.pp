# Public: Installs Vagrant 1.4.1
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant_1_4_1':
    ensure   => installed,
    source   => 'https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.1.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
