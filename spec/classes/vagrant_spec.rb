require 'spec_helper'

describe 'vagrant' do
  it do
    should contain_package('Vagrant_1_4_2').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })
  end

  context 'when specifying a specific version' do
    let (:params) {{:version => '1.4.3'}}

    it should contain_package('Vagrant_1_4_3').with_version('1.4.3')
    it should contain_package('Vagrant_1_4_3').with_source('https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.3.dmg')
  end
end
