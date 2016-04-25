require 'spec_helper'

describe 'vagrant' do
  let (:facts) { default_test_facts }

  describe 'when not specifiying a version' do
    it { should contain_package('Vagrant_1.7.4').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })}
  end

  describe 'when specifying a specific version' do
    let (:params) {{:version => '1.5.0'}}

    it { should contain_package('Vagrant_1.5.0')}
    it { should contain_package('Vagrant_1.5.0').with_source('https://releases.hashicorp.com/vagrant/1.5.0/vagrant_1.5.0.dmg')}
  end

  describe 'when installing bash completion' do
    let (:params) {{:completion => true}}

    it { should contain_package('Vagrant_1.7.4')}
    it { should contain_package('Vagrant_1.7.4').with_source('https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.dmg')}
    it { should contain_package('vagrant-completion').with_provider('homebrew')}
  end

end
