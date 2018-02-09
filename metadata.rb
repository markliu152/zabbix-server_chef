name 'zabbix-server'
maintainer 'Mark Liu'
maintainer_email '1099134352@qq.com'
license 'All Rights Reserved'
description 'Installs/Configures zabbix-server'
long_description 'Installs/Configures zabbix-server'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/markliu152/zabbix1/issues'
source_url 'https://github.com/markliu152/zabbix1'

depends 'zabbix1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/zabbix-server/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/zabbix-server'
