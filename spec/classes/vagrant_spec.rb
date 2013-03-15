require 'spec_helper'

describe 'Vagrant' do
  it do
    should contain_package('Vagrant').with({
      :provider => 'pkgdmg',
      :source   => 'http://files.vagrantup.com/packages/194948999371e9aee391d13845a0bdeb27e51ac0/Vagrant.dmg',
    })
  end
end
