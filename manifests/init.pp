# Public: Install Vagrant to /Applications.
#
# Examples
#
#   include vagrant

class vagrant {
  package { 'Vagrant':
    source   => 'http://files.vagrantup.com/packages/476b19a9e5f499b5d0b9d4aba5c0b16ebe434311/Vagrant.dmg',
    provider => pkgdmg,
  }
}
