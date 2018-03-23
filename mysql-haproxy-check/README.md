# Role mysql-haproxy-check

This role will install the check framework for HA-Proxy and
mysql. It will install the mysqlcheck script on the the
mysql servers and determine if the mysql server is healthy 
enough to recieve query's.

Keep in mind that using HA-Proxy might cause flapping under heavy load.
Flapping will most likely break mysql MASTER-MASTER replication setups when identical rows are updated.

# Usage 

Include in a role like this:

```yaml
- hosts: all
  role: 
    - mysql-haproxy-check
```

This role needs variables in host_vars/ or group_vars/:

```yaml
mysql_haproxy_check:
  only_from: 10.0.0.0/24 
  user: mysqlcheck
  password: changeme
  xinetd_port: 9200
```

## Requirements / Dependencies

* None

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`only_from`|string|allowed network|`10.0.0.0/24`
`user`|string|username|`mysqlcheck`
`password`|string|password|`changeme`
`xinetd_port`|int|xinetd listen port|`9200`
