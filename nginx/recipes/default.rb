package "nginx"

service "nginx" do
  supports :status => true, :restart => true, :reload => true
end

cookbook_file "#{node[:nginx][:dir]}/mime.types"

remote_file ::File.join(node[:nginx][:dir], "common.conf") do
  source "common.conf"
  notifies :reload, resources(:service => "nginx")
end

%w{nxensite nxdissite}.each do |nxscript|
  template "/usr/sbin/#{nxscript}" do
    source "#{nxscript}.erb"
    mode 0755
    owner "root"
    group "root"
  end
end

template "#{node[:nginx][:dir]}/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[nginx]"
end

service "nginx" do
  action [ :enable, :start ]
end

nginx_site "default" do
  enable false
end
