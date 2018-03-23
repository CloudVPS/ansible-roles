# Role nrpe

This role wil install the nagios nrpe daemon from the xlis / cloudvps
repository. 

WARNING
This NRPE setup includes --enable-command-args and dont_blame_nrpe.
Make sure to firewall your servers accordingly.
This allows the usage of check_nrpe on an external server in order to check internal servers.

This role includes many custom NRPE checks from others sources.
Please check out the commands and scripts folders for more information on them.

# Usage
Include in a role like this

```yaml
- hosts: nrpehost
  roles: 
    - nrpe
````

If the nrpe host is a external NRPE proxy.

```yaml
- hosts: nrpehost
  roles: 
    - {role: nrpe, mysql_check_user: "mysqlcheck", mysql_check_pass: "<changeme>", nrpe_allowed_hosts_list: 'na.gi.os.ip,10.0.0.0/8' }
```


Or use in group_var or host_vars like this:

```yaml
nrpe:
  allowed_hosts:
    - 1.2.3.5,
    - 10.0.0.1
```

Configure your icinga/nagios checks like this to use the proxy functionallity;

```
/usr/lib/nagios/plugins/check_nrpe -t 30 -H ext.er.nal.ip -c check_nrpe -a int.er.nal.ip check_memory
/usr/lib/nagios/plugins/check_nrpe -t 30 -H ext.er.nal.ip -c check_nrpe_1arg -a int.er.nal.ip check_partition '/'
```

## Requirements / Dependencies

* None

## Supported system

* Ubuntu

## Installation

Don't forget to add a nagios mysql user and to add it to the nagios customer services.cfg file:
```
CREATE USER 'nagios'@'%' IDENTIFIED BY '<password>';
GRANT SUPER ON *.* TO 'nagios'@'%';
FLUSH PRIVILEGES;
```

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`mysql_check_user`|string|`User used to check mysql healt`|``|`no`|
`mysql_check_pass`|string|`Pssword used to check mysql healt`|``|`no`|
`nrpe_allowed_hosts_list`|string|`Allowed host list`|``|`no`|
`nrpe.allowed_hosts`|string|`Allowed host for backwards compatibility`|``|`no`|


