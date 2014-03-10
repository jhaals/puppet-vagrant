# Vagrant Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-vagrant.png?branch=master)](https://travis-ci.org/boxen/puppet-vagrant)

Install [Vagrant](http://www.vagrantup.com/) on your Mac.

*Changes in release 3.0 and above: Vagrant will be upgraded when you change the version of this module in your Puppetfile*

## Usage

```puppet
include vagrant
```
By default, the module will install Vagrant 1.5.0. You can specify a different version of Vagrant to install (minimum version is 1.4.0 due to download locations). To install Vagrant 1.4.0, you would specify the version as follows:

```puppet
class { 'vagrant':
  version => '1.4.0'
}
```

Plugins
--
To install a plugin, the usage would look as follows:

```puppet
vagrant::plugin { 'vagrant-vmware-fusion':
  license => 'puppet:///modules/people/joe/licenses/fusion.lic',
}
```

Boxes
--

To install a box, the usage would look as follows:

```puppet
vagrant::box { 'squeeze64/vmware_fusion':
  source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
}
```

## Required Puppet Modules

* `boxen`
