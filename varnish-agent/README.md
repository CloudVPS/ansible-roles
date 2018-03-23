# Role varnish

A role to install varnish agent

# Usage

Include in role:

```yaml
- hosts: all
  role:
    - varnish-agent
```

In group_vars or host_vars:

```yaml
varnishagent:
  password: randompassword
```

## Requirements / Dependencies

* Varnish

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`password`|string|password for varnish admin|``
