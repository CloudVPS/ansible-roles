# Role Keepalived

Will install and configure Keepalived.

# Usage
Keep in mind that Keepalived uses VRRP, wich works verry well, but is not a verry secure protocol.

In order to mitigate this risk for the external VIP (Virtual IP) we can send VRRP traffic over the internal interface.
"interface {{ intnic }}"" is used to accomplish this in the configuration.

You can also use only the internal vip.

Include in your playbook like this:

```yaml
- hosts: keepalivedhost
  roles:
    - keepalived
```

If you want to manage the keepalived template yourself (ex: ansible/templates/keepalived/keepalived.cfg.j2)

```yaml
- hosts: keepalivedhost
  roles:
    - {role: keepalived, keepalived_external_template: files/keepalived/keepalived.cfg.j2 }
```

Add in your host_vars/ of group_vars/ the following example:

```yaml
keepalived:
  notification_email:
    - 'root@localhost'
  state: 
  prio: 
  pass: 
  router_id: 
  ext_router_id: 
  extvip:
    - '<ext_vip>/32'
  intvip:
    - '10.0.0.1/32'
```

## Requirements

* None

## Supported system

* Ubuntu 12.04 - 16.04

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`keepalived.extvip`|optional|`The external VIP`|``
`keepalived.extnic`|optional|`The external NIC`|`eth0`
`keepalived.intvip`|required|`The internal VIP`|``
`keepalived.intnic`|required|`The internal NIC for all VRRP and internal VIP`|`eth1`
`keepalived.state`|optional|`state`|`EQUAL`
`keepalived.notification_email`|optional|`notification_email`|``
`keepalived.prio`|optional|`prio`|`100`
`keepalived.router_id`|required|`router_id`|`13`
`keepalived.ext_router_id`|optional|`ext_router_id (must differ from router_id)`|`14`
`keepalived.pass`|required|`pass`|`changem3`
