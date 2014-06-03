# Public: Installs Vagrant
#
# Usage:
#
#   include vagrant

class vagrant($version = '1.6.3') {
  package { "Vagrant_${version}":
    ensure   => installed,
    source   => "https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}.dmg",
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
