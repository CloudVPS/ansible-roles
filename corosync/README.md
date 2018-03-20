# Role corosync

This is a role for the basic installation of a corrosync/pacemaker 2 node cluster.
Configuration has to be done afterwards via crm.

# Usage

This role needs variables when adding the role.

Include in your playbook like this:

```yaml
- hosts: all
  roles: 
    - { role: corosync, host_group: "hostgroup", clustername: "cluster1", heartbeat_hosts: ['node1.cluster', 'node2.cluster']}
```

## Requirements / Dependencies

* None

## Supported system

* Ubuntu (14.04)
* CentOS (6)

## Installation

This is a role for the basic installation of a corrosync/pacemaker 2 node cluster.
Configuration has to be done afterwards via crm.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`heartbeat_nic`|string|`Corosync heartbeat nic`|`eth0`
`clustername`|string|`Corosync Clustername`|``
`host_group`|string|`Corosync Hostgroup`|``
`heartbeat_hosts`|string|`All Corosync heartbeat hosts`|``