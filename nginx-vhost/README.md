# Role nginx-vhost

Will create virtual hosts for nginx.

- Create the docroot
- Creates vhost configuration

# Usage

Add in your host_vars/ of group_vars/ the following example:

```yaml
nginx:
  example.com:
    name: www.example.com
    docroot: /home/example/domains/www.example.com/public_html
    webuser: example
    prio: 500
  subdomain.example.com:
    name: subdomain.example.com
    serveraliases:
      - sub-a.example.com
      - sub-b.example.com
    docroot: /home/example/domains/sub.example.com/public_html/
    configfile: files/appserver/nginx-vhost/subdomain.conf
    webuser: example
    prio: 501
```

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - nginx-vhost
```

## Requirements / Dependencies

* php-fpm
* nginx package

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`name`|string|fqdn|``|`no`|
`docroot`|string|path documentroot|``|`no`|
`webuser`|string|docroot owner and group|``|`no`|
`prio`|int|vhost priority|``|`no`|
`serveraliases`|string|Server aliases|``|`yes`|
`configfile`|string|Custom config file|``|`yes`|
