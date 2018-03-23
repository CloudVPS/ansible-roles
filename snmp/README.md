# Role snmp

This role will install the snmp daemon.


# Usage

Set in group_vars/ or host_vars/

```yaml
snmp:
  community: rocommunity
  systemlocation: CLOUDVPS CLOUD
  systemcontact: support@cloudpvps.com
  monitor: 1.2.3.4
```

Include in roles like this:

```yaml
- hosts: all
  roles:
   - snmp
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
`community`|String|SNMP community|`rocommunity`
`systemlocation`|String|Location of the system|`CLOUDVPS CLOUD`
`systemcontact`|String|System contact email|``
`monitor`|String|IP from the SNMP agent|``
