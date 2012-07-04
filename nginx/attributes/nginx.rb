default[:nginx][:dir]     = "/etc/nginx"
default[:nginx][:log_dir] = "/var/log/nginx"
default[:nginx][:user]    = "www-data"
default[:nginx][:group]   = "www-data"

default[:nginx][:disable_access_log] = false
default[:nginx][:pid] = "/var/run/nginx.pid"

default[:nginx][:keepalive]          = "on"
default[:nginx][:keepalive_timeout] = 65
default[:nginx][:worker_connections] = 768
default[:nginx][:worker_processes]   = cpu[:total]
