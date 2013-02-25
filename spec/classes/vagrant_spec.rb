require 'spec_helper'

describe 'Vagrant' do
  it do
    should contain_package('Vagrant').with({
      :provider => 'pkgdmg',
      :source   => 'http://files.vagrantup.com/packages/476b19a9e5f499b5d0b9d4aba5c0b16ebe434311/Vagrant.dmg',
    })
  end
end
