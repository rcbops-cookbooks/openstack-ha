# Need to enable shared_addresses
node.set["keepalived"]["shared_addresses"] = true

# Include default keepalived recipe
include_recipe "keepalived"


node["vips"].each do |s_name, vip|
  vrrp_name = "vi_#{vip.gsub(/\./, '_')}"
  vrrp_interface = get_if_for_net('public', node)
  _, _, _, router_id = vip.split('.')

  keepalived_vrrp vrrp_name do
    interface vrrp_interface
    virtual_ipaddress Array(vip)
    virtual_router_id router_id.to_i  # Needs to be a integer between 0..255
  end
end

node["ha"]["available_services"].each do |s|
  role, ns, svc, svc_type = s["role"], s["namespace"], s["service"], s["service_type"]

  Chef::Log.info("Skipping: #{ns}-#{svc}") unless rcb_safe_deref(node, "vips.#{ns}-#{svc}")

  # See if a vip has been defined for this service, if yes create a virtual server definition
  if rcb_safe_deref(node, "vips.#{ns}-#{svc}")
    Chef::Log.info("Configuring virtual_server for #{ns}-#{svc}")

    # Lookup listen_port from the environment, or fall back to the first searched node running the role
    listen_port = rcb_safe_deref(node, "#{ns}.services.#{svc}.port") ? node[ns]["services"][svc]["port"] : get_realserver_endpoints(role, ns, svc)[0]["port"]

    # Generate array of host:port real servers
    rs_list = get_realserver_endpoints(role, ns, svc).each.inject([]) { |output,x| output << {"ip" => x["host"], "port" => x["port"]} }

    keepalived_virtual_server "#{ns}-#{svc}" do
      vs_listen_ip node["vips"]["#{ns}-#{svc}"]
      vs_listen_port listen_port.to_s
      real_servers rs_list
    end
  end
  # ********************************************************
end

# node["openstack"]["services"].each do |s|
#   role, ns, svc, svc_type = s["role"], s["namespace"], s["service"], s["service_type"]
#
#   # **** Create a vrrp ip for this service ****
#   if rcb_safe_deref(node, "vips.#{ns}-#{svc}")
#     ip_addr = node["vips"]["#{ns}-#{svc}"]
#     instance_name = "vi_#{ip_addr.gsub(/\./, '_')}"
#     vrrp_interface = get_if_for_net('public', node)
#
#     node.set["keepalived"]["instances"][instance_name] = {"ipaddresses" => ip_addr,
#                                                           "interface" => vrrp_interface}
#
#     # Create a VRRP entry
#     keepalived_vrrp instance_name do
#       interface vrrp_interface
#       virtual_router_id node['keepalived']['instance_defaults']['virtual_router_id']
#       virtual_ipaddress Array(ip_addr)
#       action :create
#     end
#   end
#   # *******************************************
#
#   # **** Create a virtual_server block for this service ****
#   # Lookup the listen_ip from the environment, or fail back to this servers ip
#   listen_ip = rcb_safe_deref(node, "#{ns}.services.#{svc}.host") ? node[ns]["services"][svc]["host"] : get_ip_for_net("public", node)
#
#   # Lookup listen_port from the environment, or fall back to the first searched node running the role
#   listen_port = rcb_safe_deref(node, "#{ns}.services.#{svc}.port") ? node[ns]["services"][svc]["port"] : get_realserver_endpoints(role, ns, svc)[0]["port"]
#
#   # Generate array of host:port real servers
#   rs_list = get_realserver_endpoints(role, ns, svc).each.inject([]) { |output,x| output << {"ip" => x["host"], "port" => x["port"]} }
#
#   keepalived_virtual_server "#{ns}-#{svc}" do
#     # this needs to be reworked, not sure where to get the listen to ip
#     vs_listen_ip listen_ip
#     vs_listen_port listen_port.to_s
#     real_servers rs_list
#   end
#   # ********************************************************
# end
