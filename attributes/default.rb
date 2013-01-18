default["ha"]["available_services"] = [
  {
    "role" => "nova-api-os-compute",
    "namespace" => "nova",
    "service" => "api",
    "service_type" => "compute"
  },
  {
    "roles" => ["nova-api-ec2"],
    "namespace" => "nova",
    "service" => "ec2-public",
    "service_type" => "ec2"
  },
  {
    "roles" => ["keystone-api"],
    "namespace" => "keystone",
    "service" => "admin-api",
    "service_type" => "identity"
  },
  {
    "roles" => ["keystone-api"],
    "namespace" => "keystone",
    "service" => "service-api",
    "service_type" => "identity"
  },
  {
    "roles" => ["cinder-api"],
    "namespace" => "cinder",
    "service" => "api",
    "service_type" => "volume"
  },
  {
    "roles" => ["glance-api"],
    "namespace" => "glance",
    "service" => "api",
    "service_type" => "image"
  },
  {
    "roles" => ["swift-proxy-server"],
    "namespace" => "swift",
    "service" => "proxy",
    "service_type" => "object-store"
  },
  {
    "roles" => ["glance-registry-master", "glance-registry-client"],
    "namespace" => "glance",
    "service" => "registry",
    "service_type" => "image"
  }
]
