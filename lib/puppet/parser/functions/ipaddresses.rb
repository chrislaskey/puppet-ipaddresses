module Puppet::Parser::Functions
  newfunction(:ipaddresses, :type => :rvalue) do |args|

    ips = Hash.new()
    interfaces = lookupvar('interfaces')    

    unless interfaces
      return ips
    end

    interfaces_array = interfaces.split(',')
    interfaces_array.each { |interface|
      facter_key = "ipaddress_#{interface}"
      ip = lookupvar(facter_key)
      if ip
        ips[interface] = ip
      end
    }

    return ips

  end
end
