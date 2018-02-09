include_recipe 'zabbix1::mysql'

bash 'zcat_create' do
  user 'root'
  command <<-"EOH"
    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u#{node['zabbix']['mysql']['user_name']} -p#{node['zabbix']['mysql']['user_password']} #{node['zabbix']['mysql']['db_name']}
  EOH
  only_if "mysqlshow --user=root --password=#{node['zabbix']['mysql']['root_password']} #{node['zabbix']['mysql']['db_name']}"
end
