# Public: Install Vagrant to /Applications.
#
# Examples
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    source   => 'http://files.vagrantup.com/packages/67bd4d30f7dbefa7c0abc643599f0244986c38c8/Vagrant.dmg',
    provider => pkgdmg,
  }

  # For license files:
  $libdir = "/Users/${::luser}/Library/Vagrant"

  file { $libdir:
    ensure => directory,
  }
}
