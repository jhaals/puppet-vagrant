# Public: Installs Vagrant 1.1.2
#
# Usage:
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    ensure   => installed,
    source   => 'http://files.vagrantup.com/packages/67bd4d30f7dbefa7c0abc643599f0244986c38c8/Vagrant.dmg',
    provider => 'pkgdmg'
  }
}
