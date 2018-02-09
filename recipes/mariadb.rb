include_recipe 'zabbix1::mysql'

execute 'zcat_create' do
 command <<-"EOH"
   zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u#{node['zabbix']['mysql']['user_name']} -p#{node['zabbix']['mysql']['user_password']} #{node['zabbix']['mysql']['db_name']}
  EOH
  only_if "mysql -u root -p#{node['zabbix']['mysql']['root_password']} -D #{node['zabbix']['mysql']['db_name']}"
end
