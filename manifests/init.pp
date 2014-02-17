# Public: Installs Vagrant 1.4.2
#
# Usage:
#
#   include vagrant

class vagrant($version) {
  package { "Vagrant_${version}":
    ensure   => installed,
    source   => 'https://dl.bintray.com/mitchellh/vagrant/Vagrant-${version}.dmg',
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
