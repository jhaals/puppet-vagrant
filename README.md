# Vagrant Puppet Module for Boxen

Install [Vagrant](http://www.vagrantup.com/) on your Mac.

## Usage

```puppet
include vagrant
```

```puppet
vagrant::plugin { 'vagrant-vmware-fusion':
  license => 'puppet:///modules/people/joe/fusion.lic',
}
```

```puppet
vagrant::box { 'centos-63-x64':
  ensure => present,
  url    => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box',
}
```

## Required Puppet Modules

* `boxen`
