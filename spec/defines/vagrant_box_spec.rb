require 'spec_helper'

describe 'vagrant::box' do
  let(:title) { 'centos-63-x64' }

  it do
    expect { should include_class('vagrant') }.to raise_error(Puppet::Error, /require url/)
  end

  context 'with ensure => absent' do
    let(:params) {{ :ensure => 'absent' }}

    it do
      should contain_exec('vagrant_box_remove_centos-63-x64').with({
        'command' => 'vagrant box remove centos-63-x64 virtualbox',
        'onlyif'  => 'vagrant box list | grep centos-63-x64',
      })
    end
  end

  context 'with ensure => absent and provider => vmware_fusion' do
    let(:params) {{
      :ensure   => 'absent',
      :provider => 'vmware_fusion',
    }}

    it do
      should contain_exec('vagrant_box_remove_centos-63-x64').with({
        'command' => 'vagrant box remove centos-63-x64 vmware_fusion',
        'onlyif'  => 'vagrant box list | grep centos-63-x64',
      })
    end
  end

  context 'with url => http://...' do
    let(:params) {{ :url => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box' }}

    it do
      should include_class('vagrant')
      should contain_exec('vagrant_box_add_centos-63-x64').with({
        'command' => 'vagrant box add centos-63-x64 http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box --provider=virtualbox',
        'unless'  => 'vagrant box list | grep centos-63-x64',
      })
    end
  end

  context 'with provider => vmware_fusion' do
    let(:params) {{
      :url => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box',
      :provider => 'vmware_fusion',
    }}

    it do
      should include_class('vagrant')
      should contain_exec('vagrant_box_add_centos-63-x64').with({
        'command' => 'vagrant box add centos-63-x64 http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box --provider=vmware_fusion',
        'unless'  => 'vagrant box list | grep centos-63-x64',
        'timeout' => '0',
      })
    end
  end
end
