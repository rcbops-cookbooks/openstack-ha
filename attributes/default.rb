default["ha"]["available_services"]["keystone-admin-api"] = {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "admin-api",
    "service_type" => "identity",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["keystone-service-api"] = {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "service-api",
    "service_type" => "identity",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["nova-api"] = {
    "role" => "nova-api-os-compute",
    "namespace" => "nova",
    "service" => "api",
    "service_type" => "compute",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["nova-ec2-public"] = {
    "role" => "nova-api-ec2",
    "namespace" => "nova",
    "service" => "ec2-public",
    "service_type" => "ec2",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["cinder-api"] = {
    "role" => "cinder-api",
    "namespace" => "cinder",
    "service" => "api",
    "service_type" => "volume",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["glance-api"] = {
    "role" => "glance-api",
    "namespace" => "glance",
    "service" => "api",
    "service_type" => "image",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["swift-proxy"] = {
    "role" => "swift-proxy-server",
    "namespace" => "swift",
    "service" => "proxy",
    "service_type" => "object-store",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["glance-registry"] = {
    "role" => "glance-registry",
    "namespace" => "glance",
    "service" => "registry",
    "service_type" => "image",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["nova-novnc-proxy"] = {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "novnc-proxy",
    "service_type" => "compute",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["nova-xvpvnc-proxy"] = {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "xvpvnc-proxy",
    "service_type" => "compute",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["horizon-dash"] = {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash",
    "service_type" => "dash",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["horizon-dash_ssl"] = {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash_ssl",
    "service_type" => "dash",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => ["ssl-hello-chk"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["ceilometer-api"] = {
    "role" => "ceilometer-api",
    "namespace" => "ceilometer",
    "service" => "api",
    "service_type" => "metering",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "ssl_lb_options" => ["ssl-hello-chk"]
}
default["ha"]["available_services"]["quantum-server"] = {
    "role" => "nova-network-controller",
    "namespace" => "quantum",
    "service" => "api",
    "service_type" => "network",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "ssl_lb_options" => ["ssl-hello-chk"]
}

default['ha']['swift-only'] = false
