require 'spec_helper'

describe 'vagrant' do
  describe 'when not specifiying a version' do
    it { should contain_package('Vagrant_1.6.2').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })}
  end

  describe 'when specifying a specific version' do
    let (:params) {{:version => '1.5.0'}}

    it { should contain_package('Vagrant_1.5.0')}
    it { should contain_package('Vagrant_1.5.0').with_source('https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.0.dmg')}
  end

end
