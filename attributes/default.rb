
default['zabbix']['packages'] = %w{zabbix-server-mysql zabbix-web-mysql mariadb mariadb-server zabbix-agent}
default['zabbix']['services'] = %w{mariadb zabbix-server zabbix-agent httpd}
default['php_value']['date']['timezone'] = 'php_value date.timezone Asia/Shanghai'
default['zabbix']['agent']['hostname'] = 'node.kds.io'
default['zabbix']['mysql']['db_name'] = 'mark'
default['zabbix']['mysql']['user_name'] = 'mliu'
default['zabbix']['mysql']['user_password'] = '123456'
default['port'] = '{80/tcp,10051/tcp}'
default['path'] = '/usr/share/doc/zabbix-server-mysql*/create.sql.gz'
