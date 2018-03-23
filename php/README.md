# Role PHP

This installs PHP.

# Usage

Default: 
```yaml
- hosts: hostname
  roles: 
    - {role: php, apache_mod_php: True, php_version: 7.0 }
```

If you want to manage the php ini template yourself (ex: /etc/php5/apache2/php.ini):

```yaml
- { role: php, apache_mod_php: True, php_ini_external_template: "{{ target_environment }}/files/appserver/php/php.ini.j2" }
```

If you want to include a custom php ini file (ex: /etc/php5/apache2/conf.d/30-custom-php.ini):

```yaml
- { role: php, apache_mod_php: True, custom_php_ini_file: "{{ target_environment }}/files/appserver/php/custom-ini.yml" }
```

## Requirements

* A webserver like Apache come in handy

## Supported system

* Ubuntu 12.04
* Ubuntu 14.04
* Ubuntu 16.04

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`php_version`|int|php version|`7.0`
`apache_mod_php`|bool|enable apache php module|`False`
`custom_php_ini_file`|file|Option to include a cutom php ini file|`False`
`php_ini_external_template`|Option to manage own php ini template|`False`|
