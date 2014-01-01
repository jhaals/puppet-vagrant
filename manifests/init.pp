# Public: Installs Vagrant 1.4.2
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant_1_4_2':
    ensure   => installed,
    source   => 'https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.2.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
