packages = ["ruby#{node[:ruby][:version]}", "ruby#{node[:ruby][:version]}", "build-essential", "lynx"]

packages.each do |pkg|
  package pkg do
    action :install
  end
end
