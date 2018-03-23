# Role rsyslog-client
Will install and configure basic rsyslog-client functionality to forward all logs to a rsyslog server.

# Usage

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - {role: rsyslog-client, rsyslog_server_ip: 10.0.0.90 }
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
`rsyslog_server_ip`|ip|`Rsyslog server IP`|`10.0.0.90`|`yes`|

