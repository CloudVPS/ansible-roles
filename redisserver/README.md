# Role redis
Will install and configure a redis master or cluster if slaves are added

Default options configured that you might want to change after installation:
- config set maxmemory 6gb
- config set maxmemory-policy allkeys-lru


# Usage

Include in your playbook like this:

```yaml
- hosts: all
  roles: 
    - redisserver
```

This role needs variables in group_vars/

Example for master host:

```yaml
redis:

```

Example for slave host:
- for the inital slaves (slaveoff)

```yaml
redis:
  slaveoff: '10.0.0.130'

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
`redis`|empty|`always needed`|``|`yes`|
`redis.slaveoff`|string|`master ip`|``|`yes`|

