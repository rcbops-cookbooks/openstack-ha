maintainer        "Rackspace US, Inc."
license           "Apache 2.0"
description       "Configures vrrp IPs and virtual_servers for openstack services"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.5"

%w{ centos ubuntu }.each do |os|
  supports os
end

%w{ haproxy keepalived nova osops-utils }.each do |dep|
  depends dep
end
