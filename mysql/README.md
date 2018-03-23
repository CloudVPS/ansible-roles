# Role mysql

Install mysql and some minor toolset for management.

## Usage

```yaml
- hosts:
  roles:
    - {role: mysql}
```

If you want to include one or more custom mysql cnf files (ex: /etc/mysql/conf.d/custom_mysql.cnf):

```yaml
- { role: mysql, custom_mysql_cnf_file: "{{ target_environment }}/files/sqlserver/mysql/custom_mysql.cnf", custom_mysql_cnf_file: "{{ target_environment }}/files/sqlserver/mysql/mysqltuner.cnf" }
```
> Note: The source file in `custom_mysql_cnf_file` should be named different for every include.

When no varables are defined, mysql without configuration is installed. 

```yaml
mysql:
  rootpassword: changeme
```

## Requirements

* None

## Supported system

* Ubuntu 12.04 - 16.04

## Installation

You might want to run mysql-client, mysql-haproxy-check or mysql-replication too.

## Role Variables

These can be specified in host_vars/ or group_vars/

|Name|Type|Description|Default|Optional
|----|----|-----------|-------|-------|
`rootpassword`|string|Mysql root password|``|`no`
`nagios_password`|string|Nagios check password|``|`yes`
`nagios_user`|string|Nagios check user|`nagios`|`yes`
`nagios_network`|string|Nagios check range|`10.0.%`|`yes`
`custom_mysql_cnf_file`|string|Option to include a custom mysql ini file|`False`
