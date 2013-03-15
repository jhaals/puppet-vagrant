require 'spec_helper'

describe 'vagrant::plugin' do
  let(:title) { 'vagrant-vmware-fusion' }

  it do
    should include_class('vagrant')
    should contain_exec('vagrant_plugin_install_vagrant-vmware-fusion').with({
      'command' => 'vagrant plugin install vagrant-vmware-fusion',
      'unless'  => 'vagrant plugin list | grep vagrant-vmware-fusion',
    })
  end

  context 'with ensure => absent' do
    let(:params) {{ :ensure => 'absent' }}

    it do
      should contain_exec('vagrant_plugin_uninstall_vagrant-vmware-fusion').with({
        'command' => 'vagrant plugin uninstall vagrant-vmware-fusion',
        'onlyif'  => 'vagrant plugin list | grep vagrant-vmware-fusion',
      })
    end
  end

  context 'with license => foo' do
    let(:facts)  {{ :luser => 'joe' }}
    let(:params) {{ :license => 'foo' }}

    it do
      should contain_file('vagrant-vmware-fusion.lic').with({
        'path'   => '/Users/joe/Library/Vagrant/vagrant-vmware-fusion.lic',
        'source' => 'foo',
      })
      should contain_exec('vagrant_plugin_license_vagrant-vmware-fusion').with({
        'command'   => 'vagrant plugin license vagrant-vmware-fusion /Users/joe/Library/Vagrant/vagrant-vmware-fusion.lic',
        'require'   => /File\[vagrant-vmware-fusion.lic\]/,
        'subscribe' => /Exec\[vagrant_plugin_install_vagrant-vmware-fusion\]/,
      })
      should contain_exec('vagrant_plugin_install_vagrant-vmware-fusion').with({
        'command' => 'vagrant plugin install vagrant-vmware-fusion',
        'unless'  => 'vagrant plugin list | grep vagrant-vmware-fusion',
      })
    end
  end
end
