#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
if node['platform_family'] == "centOS"
	package = "httpd"
elsif node['platform_family'] == "debian"
	package = "debian"
end

package 'apache2' do
	package_name package
	action :install
end

service 'apache2' do
	service_name 'httpd'
	action [:start,:enable]
end

include_recipe 'apache::websites'
