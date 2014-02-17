require 'spec_helper'

describe 'vagrant' do
  it do
    should contain_package('Vagrant_1_4_3').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })
  end

  context 'when specifying a specific version' do
    let (:params) {{:version => '1.4.2'}}

    it should contain_package('Vagrant_1_4_2').with_version('1.4.2')
    it should contain_package('Vagrant_1_4_2').with_source('https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.2.dmg')
  end
end
