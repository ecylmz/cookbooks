gem_package "unicorn"

execute "init_unicorn" do
  command "update-rc.d unicorn defaults"
  action :nothing
end

remote_file ::File.join("/etc/init.d", "unicorn") do
  source "unicorn"
  owner "root"
  group "root"
  mode 0755
  notifies :run, resources(:execute => "init_unicorn")
end

