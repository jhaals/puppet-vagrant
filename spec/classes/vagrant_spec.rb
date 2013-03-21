require 'spec_helper'

describe 'vagrant' do
  it do
    should contain_package('Vagrant').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })
  end
end
