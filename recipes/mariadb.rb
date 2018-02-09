include_recipe 'zabbix1::mysql'

bash 'zcat_create' do
  user 'root'
  cwd node['zabbix']['create']['path'].to_s
  code <<-"EOH"
    zcat #{node['zabbix']['create']['path']}/create.sql.gz | mysql -u#{node['zabbix']['mysql']['user_name']} -p#{node['zabbix']['mysql']['user_password']} #{node['zabbix']['mysql']['db_name']}
  EOH
  not_if "mysqlshow --user=root --password=#{node['zabbix']['mysql']['root_password']} #{node['zabbix']['mysql']['db_name']}"
end
