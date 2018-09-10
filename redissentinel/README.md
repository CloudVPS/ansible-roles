# Role redis-sentinel
Will setup sentinel nodes for your redis cluster.

# Usage
The haredis notification.sh script should notify your loadbalancer 
when a failover occures, however it is still expiremental. 
For now it is safer to use the following haproxy config to determine the master:

```
backend redis01
    mode tcp
    balance first
    option tcp-check
    tcp-check send info\ replication\r\n
    tcp-check expect string role:master
    server 10.0.0.20 10.0.0.20:6379 maxconn 1024 check inter 1s rise 2 fall 2
    server 10.0.0.21 10.0.0.21:6379 maxconn 1024 check inter 1s rise 2 fall 2
```


Add the role like this:

```yaml
- hosts: all
  roles: 
    - redissentinel
```

This role needs variables in group_vars/
- for the inital redis master (redis-master)
- for the quorum needed

```yaml
redis:
  redis-master: '10.0.0.130'
  quorum: '1'
```

## Requirements / Dependencies

* an existing redis-server master

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`redis-master`|string|`The first redis node/master`|``|`yes`|
`quorum`|string|`The cluster Quorum`|``|`yes`|
