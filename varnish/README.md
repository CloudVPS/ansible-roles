# Role varnish

A role to install varnish cache

# Usage

Include in role:

```yaml
- hosts: all
  role:
    - varnish
```

In group_vars or host_vars:

```yaml
varnish:
  listenport: 80
  cachetype: malloc
  cachesize: 256m
```

If you want to manage the varnish template yourself (ex: ansible/templates/varnish/default.vcl.j2)

```yaml
- hosts: varnishhost
  roles: {role: varnish, varnish_external_template: files/varnish/default.vcl.j2 }
```

If you want to use a file in the top directory of your ansible config: (ex: ansible/files/varnish/default.vcl)
you can use:

```yaml
- { role: varnish, varnish_external_file: files/varnish/default.vcl }

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
`varnish_external_template`|string|`default.vcl`|`see default.vcl.j2, uses local backend at 8080`|`no`|
`varnish_external_file`|string|`default.vcl`|`see default.vcl.j2, uses local backend at 8080`|`no`|
`varnish_external_default_file`|string|`/etc/default/varnish config file`|`see varnish.j2 and options below`|`no`|
`varnish_external_default_template`|string|`/etc/default/varnish template`|`see varnish.j2 and options below`|`no`|
`varnish.listenport`|int|listenport for varnish|`6081`
`varnish.cachetype`|string|malloc or file cache type|`malloc`
`varnish.cachesize`|string|256m, or 1g|`256m`

