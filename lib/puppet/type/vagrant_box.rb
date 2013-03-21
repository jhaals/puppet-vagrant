Puppet::Type.newtype :vagrant_box do
  ensurable do
    newvalue :present do
      provider.create
    end

    newvalue :absent do
      provider.destroy
    end

    defaultto :present
  end

  newparam :name do
    isnamevar

    validate do |value|
      unless value =~ /\A\w+\/\w+\z/
        raise Puppet::Error, "Malformed name: vagrant_box[#{value}]"
      end
    end
  end

  newparam :source do
  end

  newparam :force do
    validate do |value|
      unless value.is_a? Boolean
        raise Puppet::Error, "Force must be true or false."
      end
    end
  end

  autorequire :package do
    %w(Vagrant vagrant)
  end

  autorequire :vagrant_plugin do
    Array.new.tap do |a|
      vagrant_provider = self[:name].partition('/').first

      a << vagrant_provider if vagrant_provider != 'virtualbox'
    end
  end
end
