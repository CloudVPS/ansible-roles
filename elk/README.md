# Role elk
Will install Oracle Java 8, elasticsearch, logstash, kibana and nginx from elastic and Java 8 repositories.

- Configures rsyslog to send local logs to logstash
- Configures nginx to proxy to port 5601 of kibana
- Configure logstash to receive apache logs

# Usage

Include in your playbook like this:

```yaml
- hosts: all
  roles: 
    - elk
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
``|string|``|`-`

