define :gem_install do
  params[:name].each do |pkg|
    gem_package pkg do
      action :install
    end
  end
end
