# Role ipv6
Will enable or disable ipv6

# Usage

Include in your playbook like this:

```yaml
- hosts: all
  roles: 
    - ipv6
```

This role needs variables per host in host_vars/ or in group_vars/(all)
If ipv6 is not defined or ipv6.disable == 'True' the module will disable ipv6.

Example:

```yaml

ipv6:
  disable: True

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
`ipv6.disable`|string|``|``

