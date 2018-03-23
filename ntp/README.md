# Role ntp

This role installes the ntp package and starts the ntpd service with the default configuration.

# Usage

Include the role in your hosts:

```yaml
- hosts: all
  roles:
    - ntp
```

## Requirements / Dependencies

* None

## Supported system

* Ubuntu
* CentOS

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`none`|string|``|``|`yes`|
