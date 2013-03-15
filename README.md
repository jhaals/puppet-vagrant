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

## Required Puppet Modules

* `boxen`
