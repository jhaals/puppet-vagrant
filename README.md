# Vagrant Puppet Module for Boxen

Install [Vagrant](http://www.vagrantup.com/) on your Mac.

## Usage

```puppet
include vagrant

vagrant::plugin { 'vagrant-vmware-fusion':
  license => 'puppet:///modules/people/joe/licenses/fusion.lic',
}

vagrant::box { 'squeeze64/vmware_fusion':
  url => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
}
```

## Required Puppet Modules

* `boxen`
