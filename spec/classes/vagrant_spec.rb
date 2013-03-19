require 'spec_helper'

describe 'Vagrant' do
  let(:facts) {{ :luser => 'joe' }}
  it do
    should contain_package('Vagrant').with({
      :provider => 'pkgdmg',
      :source   => 'http://files.vagrantup.com/packages/67bd4d30f7dbefa7c0abc643599f0244986c38c8/Vagrant.dmg',
    })

    should contain_file('/Users/joe/Library/Vagrant').with({
      :ensure => 'directory',
    })
  end
end
