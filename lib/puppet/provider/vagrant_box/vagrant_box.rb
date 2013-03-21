require 'puppet/util/execution'

Puppet::Type.type(:vagrant_box).provide :vagrant_box do
  include Puppet::Util::Execution

  def create
    name, vprovider = @resource[:name].split('/')

    cmd = [
      "/usr/bin/vagrant",
      "box",
      "add",
      name,
      @resource[:source],
      "--provider",
      vprovider
    ]

    cmd << "--force" if @resource[:force]

    execute cmd, opts
  end

  def destroy
    name, vprovider = @resource[:name].split('/')

    cmd = [
      "/usr/bin/vagrant",
      "box",
      "remove",
      name,
    ]

    execute cmd, opts
  end

  def exists?
    if @resource[:force]
      false
    else
      name, vprovider = @resource[:name].split('/')

      File.directory? \
        "/Users/#{Facter[:boxen_user].value}/.vagrant.d/boxes/#{name}/#{vprovider}"
    end
  end

  private
  def custom_environment
    {
      "HOME"         => "/Users/#{Facter[:boxen_user].value}",
      "VAGRANT_HOME" => "/Users/#{Facter[:boxen_user].value}/.vagrant.d",
    }
  end

  def opts
    {
      :combine            => true,
      :custom_environment => custom_environment,
      :failonfail         => true,
      :uid                => Facter[:boxen_user].value,
    }
  end
end
