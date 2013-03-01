default["ha"]["available_services"] = [
  {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "admin-api",
    "service_type" => "identity"
  },
  {
    "role" => "keystone-api",
    "namespace" => "keystone",
    "service" => "service-api",
    "service_type" => "identity"
  },
  {
    "role" => "nova-api-os-compute",
    "namespace" => "nova",
    "service" => "api",
    "service_type" => "compute"
  },
  {
    "role" => "nova-api-ec2",
    "namespace" => "nova",
    "service" => "ec2-public",
    "service_type" => "ec2"
  },
  {
    "role" => "cinder-api",
    "namespace" => "cinder",
    "service" => "api",
    "service_type" => "volume"
  },
  {
    "role" => "glance-api",
    "namespace" => "glance",
    "service" => "api",
    "service_type" => "image"
  },
  {
    "role" => "swift-proxy-server",
    "namespace" => "swift",
    "service" => "proxy",
    "service_type" => "object-store"
  },
  {
    "role" => "glance-registry",
    "namespace" => "glance",
    "service" => "registry",
    "service_type" => "image"
  },
  {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "novnc-proxy",
    "service_type" => "compute"
  },
  {
    "role" => "nova-vncproxy",
    "namespace" => "nova",
    "service" => "xvpvnc-proxy",
    "service_type" => "compute"
  },
  {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash",
    "service_type" => "dash"
  },
  {
    "role" => "horizon-server",
    "namespace" => "horizon",
    "service" => "dash_ssl",
    "service_type" => "dash"
  }
]
