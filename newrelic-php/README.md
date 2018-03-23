# Role newrelic-php

Install and configure the New Relic PHP module from the newrelic repo.

# Usage

Add in your host_vars/ of group_vars/ the following example:

```yaml
newrelic:
  license: <YOUR NEWRELIC LICENSE KEY>
  appname: <MY APP>
```

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - newrelic-php
```

## Requirements / Dependencies

* Apache2 and php must be installed

## Supported system

* Ubuntu 14.04 - 16.04
* CentOS 6 (php5 only)

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Optional|
|----|----|-----------|-------|-------|
`newrelic.license`|string|`Newrelic license`|``|`no`|
`newrelic.appname`|string|`Newrelic APM appname`|`<hostname> PHP`|`yes`|