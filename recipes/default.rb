#
# Cookbook:: zabbix-server
# Recipe:: default
#
# Copyright:: 2018, Mark Liu, All Rights Reserved.


include_recipe 'zabbix1::release'
include_recipe 'zabbix1::firewall'
include_recipe 'zabbix-server::mysql'

node['zabbix']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/zabbix/zabbix_agentd.conf' do
  source 'agent.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/httpd/conf.d/zabbix.conf' do
  source 'zabbix.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/zabbix/zabbix_server.conf' do
  source 'server.erb'
  owner 'root'
  group 'zabbix'
  mode '0644'
end

include_recipe 'zabbix1::selinux'

node['zabbix']['services'].each do |svc|
  service svc do
    action [:enable, :start]
  end
end
