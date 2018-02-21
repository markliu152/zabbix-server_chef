package 'mariadb' 
package 'mariadb-server'
service 'mariadb' do
  action [:enable, :start]
end

bash "create_database" do
  code <<-EOH
    mysql -uroot -e "create database #{node['zabbix']['mysql']['db_name']} character set utf8 collate utf8_bin;"
    mysql -uroot -e "grant all privileges on #{node['zabbix']['mysql']['db_name']}.* to #{node['zabbix']['mysql']['user_name']}@localhost identified by '#{node['zabbix']['mysql']['user_password']}';"
  EOH
  not_if "mysql -uroot -e'show databases;' | grep #{node['zabbix']['mysql']['db_name']}"
end

bash 'extract_data' do
  code <<-EOH
    zcat #{node['path']} | mysql -u#{node['zabbix']['mysql']['user_name']} -p#{node['zabbix']['mysql']['user_password']} #{node['zabbix']['mysql']['db_name']}
  EOH
end
