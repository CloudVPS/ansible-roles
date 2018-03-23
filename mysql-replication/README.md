
# Role mysql-replication
Will setup mysql master-master replication in a new setup.
This role will not fix a broken replication for you.
There is a mysql-rebuild-slave.yml in the examples for that.

Note:
The SSL feature of mysql replication seems to be broken from 5.6 and up.

# Usage

These variables are mandatory and configuration is per host_vars/ 

Example for sql1

```yaml
mysqlreplication:
  server_id: 1
  network: '"%"'
  replicationpassword: replication4life
  master_host: 10.0.0.110
  increment: 2
  incrementoffset: 1
```

# Usage

Example for sql2

```yaml
mysqlreplication:
  server_id: 2
  network: '"%"'
  replicationpassword: replication4life
  master_host: 10.0.0.100
  increment: 2
  incrementoffset: 2
```

## Requirements / Dependencies

* mysql should be cleanly installed

## Supported system

* Ubuntu 12.04 - 16.04

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Optional|
|----|----|-----------|-------|-------|
`mysqlreplication.server_id`|string|`server_id`|``|`no`|
`mysqlreplication.network`|string|``|`allowed network`|`no`|
`mysqlreplication.replicationpassword`|string|`replication password`|``|`no`|
`mysqlreplication.master_host`|string|`master_host`|``|`no`|
`mysqlreplication.increment`|string|`increment`|``|`no`|
`mysqlreplication.incrementoffset`|string|`incrementoffset`|``|`no`|
