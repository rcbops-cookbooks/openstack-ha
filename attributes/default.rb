default["ha"]["available_services"] = [
  {
    "role" => "nova-api-os-compute",
    "namespace" => "nova",
    "service" => "api",
    "service_type" => "compute"
  },
# We done need both of these b/c they are the same role and endpoint (except for path)
#  {
#    "role" => "nova-api-ec2",
#    "namespace" => "nova",
#    "service" => "ec2-admin",
#    "service_type" => "ec2"
#  },
  {
    "role" => "nova-api-ec2",
    "namespace" => "nova",
    "service" => "ec2-public",
    "service_type" => "ec2"
  },
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
    "role" => "glance-registry",
    "namespace" => "glance",
    "service" => "registry",
    "service_type" => "image"
  },
  {
    "role" => "swift-proxy-server",
    "namespace" => "swift",
    "service" => "proxy",
    "service_type" => "object-store"
  }
]
