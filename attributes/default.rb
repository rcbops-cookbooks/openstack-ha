default["ha"]["available_services"]["keystone-admin-api"] = {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "admin-api",
    "service_type" => "identity",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 12,
    "vip_network" => "public"
}
default["ha"]["available_services"]["keystone-service-api"] = {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "service-api",
    "service_type" => "identity",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 13,
    "vip_network" => "public"
}
default["ha"]["available_services"]["nova-api"] = {
    "role" => "nova-api-os-compute",
    "namespace" => "nova",
    "service" => "api",
    "service_type" => "compute",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 14,
    "vip_network" => "public"
}
default["ha"]["available_services"]["nova-ec2-public"] = {
    "role" => "nova-api-ec2",
    "namespace" => "nova",
    "service" => "ec2-public",
    "service_type" => "ec2",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 15,
    "vip_network" => "public"
}
default["ha"]["available_services"]["cinder-api"] = {
    "role" => "cinder-api",
    "namespace" => "cinder",
    "service" => "api",
    "service_type" => "volume",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 16,
    "vip_network" => "public"
}
default["ha"]["available_services"]["glance-api"] = {
    "role" => "glance-api",
    "namespace" => "glance",
    "service" => "api",
    "service_type" => "image",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 17,
    "vip_network" => "public"
}
default["ha"]["available_services"]["swift-proxy"] = {
    "role" => "swift-proxy-server",
    "namespace" => "swift",
    "service" => "proxy",
    "service_type" => "object-store",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 18,
    "vip_network" => "public"
}
default["ha"]["available_services"]["glance-registry"] = {
    "role" => "glance-registry",
    "namespace" => "glance",
    "service" => "registry",
    "service_type" => "image",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 19,
    "vip_network" => "public"
}
default["ha"]["available_services"]["nova-novnc-proxy"] = {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "novnc-proxy",
    "service_type" => "compute",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 20,
    "vip_network" => "public"
}
default["ha"]["available_services"]["nova-xvpvnc-proxy"] = {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "xvpvnc-proxy",
    "service_type" => "compute",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 21,
    "vip_network" => "public"
}
default["ha"]["available_services"]["horizon-dash"] = {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash",
    "service_type" => "dash",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 22,
    "vip_network" => "public"
}
default["ha"]["available_services"]["horizon-dash_ssl"] = {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash_ssl",
    "service_type" => "dash",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => ["ssl-hello-chk"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 23,
    "vip_network" => "public"
}
default["ha"]["available_services"]["ceilometer-api"] = {
    "role" => "ceilometer-api",
    "namespace" => "ceilometer",
    "service" => "api",
    "service_type" => "metering",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"],
    "vrid" => 24,
    "vip_network" => "public"
}

if node["nova"]["network"]["provider"] == "quantum"
    default["ha"]["available_services"]["quantum-server"] = {
        "role" => "nova-network-controller",
        "namespace" => "quantum",
        "service" => "api",
        "service_type" => "network",
        "lb_mode" => "http",
        "lb_algorithm" => "roundrobin",
        "lb_options" => [],
        "ssl_lb_options" => ["ssl-hello-chk"],
        "vrid" => 25,
        "vip_network" => "public"
    }
end

default['ha']['swift-only'] = false
