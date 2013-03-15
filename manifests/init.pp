# Public: Install Vagrant to /Applications.
#
# Examples
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    source   => 'http://files.vagrantup.com/packages/194948999371e9aee391d13845a0bdeb27e51ac0/Vagrant.dmg',
    provider => pkgdmg,
  }
}
