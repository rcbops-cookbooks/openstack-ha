default["ha"]["available_services"] = [
  {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "admin-api",
    "service_type" => "identity",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "vrid" => 1
  },
  {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "service-api",
    "service_type" => "identity",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "vrid" => 2
  },
  {
    "role" => "nova-api-os-compute",
    "namespace" => "nova",
    "service" => "api",
    "service_type" => "compute",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "vrid" => 3
  },
  {
    "role" => "nova-api-ec2",
    "namespace" => "nova",
    "service" => "ec2-public",
    "service_type" => "ec2",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "vrid" => 4
  },
  {
    "role" => "cinder-api",
    "namespace" => "cinder",
    "service" => "api",
    "service_type" => "volume",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "vrid" => 5
  },
  {
    "role" => "glance-api",
    "namespace" => "glance",
    "service" => "api",
    "service_type" => "image",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "vrid" => 6
  },
  {
    "role" => "swift-proxy-server",
    "namespace" => "swift",
    "service" => "proxy",
    "service_type" => "object-store",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "vrid" => 7
  },
  {
    "role" => "glance-registry",
    "namespace" => "glance",
    "service" => "registry",
    "service_type" => "image",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => [],
    "vrid" => 8
  },
  {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "novnc-proxy",
    "service_type" => "compute",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "vrid" => 9
  },
  {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "xvpvnc-proxy",
    "service_type" => "compute",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "vrid" => 10
  },
  {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash",
    "service_type" => "dash",
    "lb_mode" => "http",
    "lb_algorithm" => "roundrobin",
    "lb_options" => ["forwardfor", "httpchk", "httplog"],
    "vrid" => 11
  },
  {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash_ssl",
    "service_type" => "dash",
    "lb_mode" => "tcp",
    "lb_algorithm" => "source",
    "lb_options" => [],
    "vrid" => 12
  }
]
default['ha']['swift-only'] = false
