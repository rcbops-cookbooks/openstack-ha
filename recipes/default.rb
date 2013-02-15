# Need to enable shared_addresses
# node.set["keepalived"]["shared_address"] = true

# Include default keepalived recipe
include_recipe "keepalived"

# Include default haproxy recipe, for loadbalancing
include_recipe "haproxy::default"

ks_admin_endpoint = get_access_endpoint("keystone", "keystone", "admin-api")
keystone = get_settings_by_role("keystone","keystone")
haproxy_platform_options = node["haproxy"]["platform"]

# set up floating ip/load balancer for the defined services
node["ha"]["available_services"].each do |s|
  role, ns, svc, svc_type = s["role"], s["namespace"], s["service"], s["service_type"]

  Chef::Log.info("Skipping: #{ns}-#{svc}") unless rcb_safe_deref(node, "vips.#{ns}-#{svc}")

  # See if a vip has been defined for this service, if yes create a vrrp and virtual server definition
  if listen_ip = rcb_safe_deref(node, "vips.#{ns}-#{svc}")

    # first configure the vrrp
    Chef::Log.info("Configuring vrrp for #{ns}-#{svc}")
    vrrp_name = "vi_#{listen_ip.gsub(/\./, '_')}"
    vrrp_interface = get_if_for_net('public', node)
    router_id = listen_ip.split(".")[3]

    keepalived_chkscript "haproxy" do
      script "#{haproxy_platform_options["service_bin"]} #{haproxy_platform_options["haproxy_service"]} status"
      interval 5
      action :create
      not_if {File.exists?('/etc/keepalived/conf.d/script_haproxy.conf')}
    end

    keepalived_vrrp vrrp_name do
      interface vrrp_interface
      virtual_ipaddress Array(listen_ip)
      virtual_router_id router_id.to_i  # Needs to be a integer between 0..255
      track_script "haproxy"
      notify_master "#{haproxy_platform_options["service_bin"]} haproxy restart"
      notify_backup "#{haproxy_platform_options["service_bin"]} haproxy stop "
      notify_fault "#{haproxy_platform_options["service_bin"]} haproxy stop"
    end

    # now configure the virtual server
    Chef::Log.info("Configuring virtual_server for #{ns}-#{svc}")

    # Lookup listen_port from the environment, or fall back to the first searched node running the role
    listen_port = rcb_safe_deref(node, "#{ns}.services.#{svc}.port") ? node[ns]["services"][svc]["port"] : get_realserver_endpoints(role, ns, svc)[0]["port"]

    # Generate array of host:port real servers
    rs_list = get_realserver_endpoints(role, ns, svc).each.inject([]) { |output,x| output << {"ip" => x["host"], "port" => x["port"]} }
    Chef::Log.debug "realserver list is #{rs_list}"

    haproxy_virtual_server "#{ns}-#{svc}" do
      if svc == "dash_ssl"
        mode "tcp"
      end
      vs_listen_ip listen_ip
      vs_listen_port listen_port.to_s
      real_servers rs_list
    end

    # Need to update keystone endpoint
    case svc_type
    when "ec2"
      public_endpoint = get_access_endpoint(role, ns, "ec2-public")
      admin_path = get_settings_by_role(role, ns)['services']['ec2-admin']['path']
      admin_endpoint = {'uri' => "#{public_endpoint['scheme']}://#{public_endpoint['host']}:#{public_endpoint['port']}#{admin_path}" }
    when "identity"
      public_endpoint = get_access_endpoint(role, ns, "service-api")
      admin_endpoint  = get_access_endpoint(role, ns, "admin-api")
    else
      public_endpoint = get_access_endpoint(role, ns, svc)
      admin_endpoint  = public_endpoint.clone
    end

    unless "#{ns}-#{svc}" == "glance-registry" ||
        "#{ns}-#{svc}" == "nova-xvpvnc-proxy" ||
        "#{ns}-#{svc}" == "nova-novnc-proxy" ||
        "#{ns}-#{svc}" == "horizon-dash" ||
        "#{ns}-#{svc}" == "horizon-dash_ssl"

      keystone_register "Recreate Endpoint" do
        auth_host ks_admin_endpoint["host"]
        auth_port ks_admin_endpoint["port"]
        auth_protocol ks_admin_endpoint["scheme"]
        api_ver ks_admin_endpoint["path"]
        auth_token keystone["admin_token"]
        service_type svc_type
        endpoint_region node["nova"]["compute"]["region"]
        endpoint_adminurl admin_endpoint['uri']
        endpoint_internalurl public_endpoint["uri"]
        endpoint_publicurl public_endpoint["uri"]
        action :recreate_endpoint
      end
    end
  end
  # ********************************************************
end
