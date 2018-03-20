# Role apache-vhost

Will create virtual hosts for apache2.

- Create the docroot
- Creates vhost configuration

# Usage

Add in your host_vars/ of group_vars/ the following example:

```yaml
apache_vhost:
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
    webuser: example
    prio: 500
```

For SSL support, add the specific lines:

```yaml
apache_vhost:
  example.com:
    name: www.example.com
    docroot: /home/example/domains/www.example.com/public_html
    webuser: example
    prio: 500
    ssl: true
    ssl_ip: 1.2.3.4
    ssl_certfile: example.com.crt
    ssl_keyfile: example.com.key
    ssl_chainfile: thawte-ca-bundle.pem
```

Optional lines `ssl_*` can be used when `ssl` is set to `true`. Each line can be used separately. At least `ssl_ip ` should be used.

SSL-related files should be placed in `<ansible root>/<environment>/files/` directory. For example:

`/root/ansible/production/files/example.com.crt`

Which will then be copied to `/etc/apache2/example.com.crt`, if specified in the vars section.

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - apache-vhost
```

## Requirements / Dependencies

* Apache2

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`name`|string|fqdn|``
`docroot`|string|path documentroot|``
`webuser`|string|docroot owner and group|``
`prio`|int|vhost priority|``
`serveraliases`|hash|Server aliases|``
`modruid`|string|defined value true |`false`
`ssl`|bool|enabled|no
`ssl_ip`|string|ip address|``
`ssl_certfile`|string|path to ssl cert file|``
`ssl_keyfile`|string|path to ssl key file|``
`ssl_chainfile`|string|path to ca file|``
