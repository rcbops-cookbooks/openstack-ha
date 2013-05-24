default["ha"]["available_services"]["keystone-admin-api"]["role"] = "keystone-api"
default["ha"]["available_services"]["keystone-admin-api"]["namespace"] = "keystone"
default["ha"]["available_services"]["keystone-admin-api"]["service"] = "admin-api"
default["ha"]["available_services"]["keystone-admin-api"]["service_type"] = "identity"
default["ha"]["available_services"]["keystone-admin-api"]["lb_mode"] = "http"
default["ha"]["available_services"]["keystone-admin-api"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["keystone-admin-api"]["lb_options"] = ["forwardfor", "httpchk", "httplog"]
default["ha"]["available_services"]["keystone-admin-api"]["vrid"] = 0

default["ha"]["available_services"]["keystone-service-api"]["role"] = "keystone-api"
default["ha"]["available_services"]["keystone-service-api"]["namespace"] = "keystone"
default["ha"]["available_services"]["keystone-service-api"]["service"] = "service-api"
default["ha"]["available_services"]["keystone-service-api"]["service_type"] = "identity"
default["ha"]["available_services"]["keystone-service-api"]["lb_mode"] = "http"
default["ha"]["available_services"]["keystone-service-api"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["keystone-service-api"]["lb_options"] = ["forwardfor", "httpchk", "httplog"]
default["ha"]["available_services"]["keystone-service-api"]["vrid"] = 0

default["ha"]["available_services"]["nova-api"]["role"] = "nova-api-os-compute"
default["ha"]["available_services"]["nova-api"]["namespace"] = "nova"
default["ha"]["available_services"]["nova-api"]["service"] = "api"
default["ha"]["available_services"]["nova-api"]["service_type"] = "compute"
default["ha"]["available_services"]["nova-api"]["lb_mode"] = "http"
default["ha"]["available_services"]["nova-api"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["nova-api"]["lb_options"] = ["forwardfor", "httpchk", "httplog"]
default["ha"]["available_services"]["nova-api"]["vrid"] = 0

default["ha"]["available_services"]["nova-ec2-public"]["role"] = "nova-api-ec2"
default["ha"]["available_services"]["nova-ec2-public"]["namespace"] = "nova"
default["ha"]["available_services"]["nova-ec2-public"]["service"] = "ec2-public"
default["ha"]["available_services"]["nova-ec2-public"]["service_type"] = "ec2"
default["ha"]["available_services"]["nova-ec2-public"]["lb_mode"] = "http"
default["ha"]["available_services"]["nova-ec2-public"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["nova-ec2-public"]["lb_options"] = []
default["ha"]["available_services"]["nova-ec2-public"]["vrid"] = 0

default["ha"]["available_services"]["cinder-api"]["role"] = "cinder-api"
default["ha"]["available_services"]["cinder-api"]["namespace"] = "cinder"
default["ha"]["available_services"]["cinder-api"]["service"] = "api"
default["ha"]["available_services"]["cinder-api"]["service_type"] = "volume"
default["ha"]["available_services"]["cinder-api"]["lb_mode"] = "http"
default["ha"]["available_services"]["cinder-api"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["cinder-api"]["lb_options"] = ["forwardfor", "httpchk", "httplog"]
default["ha"]["available_services"]["cinder-api"]["vrid"] = 0

default["ha"]["available_services"]["glance-api"]["role"] = "glance-api"
default["ha"]["available_services"]["glance-api"]["namespace"] = "glance"
default["ha"]["available_services"]["glance-api"]["service"] = "api"
default["ha"]["available_services"]["glance-api"]["service_type"] = "image"
default["ha"]["available_services"]["glance-api"]["lb_mode"] = "http"
default["ha"]["available_services"]["glance-api"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["glance-api"]["lb_options"] = ["forwardfor", "httpchk", "httplog"]
default["ha"]["available_services"]["glance-api"]["vrid"] = 0

default["ha"]["available_services"]["swift-proxy"]["role"] = "swift-proxy-server"
default["ha"]["available_services"]["swift-proxy"]["namespace"] = "swift"
default["ha"]["available_services"]["swift-proxy"]["service"] = "proxy"
default["ha"]["available_services"]["swift-proxy"]["service_type"] = "object-store"
default["ha"]["available_services"]["swift-proxy"]["lb_mode"] = "http"
default["ha"]["available_services"]["swift-proxy"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["swift-proxy"]["lb_options"] = []
default["ha"]["available_services"]["swift-proxy"]["vrid"] = 0

default["ha"]["available_services"]["glance-registry"]["role"] = "glance-registry"
default["ha"]["available_services"]["glance-registry"]["namespace"] = "glance"
default["ha"]["available_services"]["glance-registry"]["service"] = "registry"
default["ha"]["available_services"]["glance-registry"]["service_type"] = "image"
default["ha"]["available_services"]["glance-registry"]["lb_mode"] = "http"
default["ha"]["available_services"]["glance-registry"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["glance-registry"]["lb_options"] = []
default["ha"]["available_services"]["glance-registry"]["vrid"] = 0

default["ha"]["available_services"]["nova-novnc-proxy"]["role"] = "nova-vncproxy"
default["ha"]["available_services"]["nova-novnc-proxy"]["namespace"] = "nova"
default["ha"]["available_services"]["nova-novnc-proxy"]["service"] = "novnc-proxy"
default["ha"]["available_services"]["nova-novnc-proxy"]["service_type"] = "compute"
default["ha"]["available_services"]["nova-novnc-proxy"]["lb_mode"] = "tcp"
default["ha"]["available_services"]["nova-novnc-proxy"]["lb_algorithm"] = "source"
default["ha"]["available_services"]["nova-novnc-proxy"]["lb_options"] = []
default["ha"]["available_services"]["nova-novnc-proxy"]["vrid"] = 0

default["ha"]["available_services"]["nova-xvpvnc-proxy"]["role"] = "nova-vncproxy"
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["namespace"] = "nova"
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["service"] = "xvpvnc-proxy"
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["service_type"] = "compute"
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["lb_mode"] = "tcp"
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["lb_algorithm"] = "source"
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["lb_options"] = []
default["ha"]["available_services"]["nova-xvpvnc-proxy"]["vrid"] = 0

default["ha"]["available_services"]["horizon-dash"]["role"] = "horizon-server"
default["ha"]["available_services"]["horizon-dash"]["namespace"] = "horizon"
default["ha"]["available_services"]["horizon-dash"]["service"] = "dash"
default["ha"]["available_services"]["horizon-dash"]["service_type"] = "dash"
default["ha"]["available_services"]["horizon-dash"]["lb_mode"] = "http"
default["ha"]["available_services"]["horizon-dash"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["horizon-dash"]["lb_options"] = ["forwardfor", "httpchk", "httplog"]
default["ha"]["available_services"]["horizon-dash"]["vrid"] = 0

default["ha"]["available_services"]["horizon-dash_ssl"]["role"] = "horizon-server"
default["ha"]["available_services"]["horizon-dash_ssl"]["namespace"] = "horizon"
default["ha"]["available_services"]["horizon-dash_ssl"]["service"] = "dash_ssl"
default["ha"]["available_services"]["horizon-dash_ssl"]["service_type"] = "dash"
default["ha"]["available_services"]["horizon-dash_ssl"]["lb_mode"] = "tcp"
default["ha"]["available_services"]["horizon-dash_ssl"]["lb_algorithm"] = "source"
default["ha"]["available_services"]["horizon-dash_ssl"]["lb_options"] = []
default["ha"]["available_services"]["horizon-dash_ssl"]["vrid"] = 0

default["ha"]["available_services"]["ceilometer-api"]["role"] = "ceilometer-api"
default["ha"]["available_services"]["ceilometer-api"]["namespace"] = "ceilometer"
default["ha"]["available_services"]["ceilometer-api"]["service"] = "api"
default["ha"]["available_services"]["ceilometer-api"]["service_type"] = "metering"
default["ha"]["available_services"]["ceilometer-api"]["lb_mode"] = "http"
default["ha"]["available_services"]["ceilometer-api"]["lb_algorithm"] = "roundrobin"
default["ha"]["available_services"]["ceilometer-api"]["lb_options"] = []
default["ha"]["available_services"]["ceilometer-api"]["vrid"] = 0

default['ha']['swift-only'] = false
