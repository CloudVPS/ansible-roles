# Role unison
If nothing is set, the module will just intall
Unison with no configuration.

If syncjobs are defined they wil be configured as well as ssh keys exchanged.

# Usage

Include in your playbook like this:

```yaml
- hosts: all
  roles: 
    - unison
```

This role needs variables per host in host_vars/*

Example for master host:

```yaml
unison:
  state: master
  syncjob:
    - name: 'default'
      slave_ip: '10.0.0.21'
      slave_dir: '/var/www/'
      master_dir: '/var/www/'
    - name: 'user'
      slave_ip: '10.0.0.21'
      slave_dir: '/home/user/domains/public_html/'
      master_dir: '/home/user/domains/public_html/'
      ignoredpaths:
        - "tmp/logs"
```

Example for slave host:

```yaml
unison:
  state: slave
```



## Requirements / Dependencies

* None

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`unison.state`|string|`Is this the master or slave`|``|`yes`|
`unison.syncjob`|string|`Details for each syncjob`|``|`yes`|
`syncjob.{item}.name`|string|`Syncjob ame`|``|`yes`|
`syncjob.{item}.slave_ip`|string|`Syncjob slave_ip`|``|`yes`|
`syncjob.{item}.slave_dir`|string|`Syncjob slave_dir`|``|`yes`|
`syncjob.{item}.master_dir`|string|`Syncjob master_dir`|``|`yes`|
`syncjob.{item}.ignoredpaths.{item}`|string|`Syncjob ignoredpaths`|``|`no`|