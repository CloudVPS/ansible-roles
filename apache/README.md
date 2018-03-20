# Role apache

Will install apache2 and push custom configuration when required.
Use apache-vhost and apache-modules for vhosts and modules.

# Usage


Add in your host_vars/ of group_vars/ the following example:

```yaml
apache:
  timeout: 300
  keepalive: 5
```

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - {role: apache, apache_external_conf_file: "path_to_file"}
```

## Requirements

* None

## Supported system

* Ubuntu (12.04, 14.04, 16.04)

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`apache_external_conf_template`|string|External conf jina template|``
`apache_external_conf_file`|string|External conf file|``
`apache_external_security_template`|string|External conf template|``
`apache.timeout`|string|``|`300`
`apache.keepalive`|string|``|`On`
`apache.keepaliverequests`|string|``|`100`
`apache.keepalivetimeout`|string|``|`5`
`apache.RUN_USER`|string|`apache.RUN_GROUP`|`www-data`
`apache.RUN_GROUP`|string|`apache.RUN_GROUP`|`www-data`
`apache.servertokens`|string|`apache.servertokens`|`Prod`
`apache.serversignature`|string|`apache.serversignature`|`Off`
`apache.traceenable`|string|`apache.traceenable`|`Off`
`apache_mpm_prefork_module.startservers`|string|`apache_mpm_prefork_module.startservers`|`5`
`apache_mpm_prefork_module.minspareservers`|string|`apache_mpm_prefork_module.minspareservers`|`5`
`apache_mpm_prefork_module.maxspareservers`|string|`apache_mpm_prefork_module.maxspareservers`|`100`
`apache_mpm_prefork_module.maxclients`|string|`apache_mpm_prefork_module.maxclients`|`150`
`apache_mpm_prefork_module.maxrequestsperchild`|string|`apache_mpm_prefork_module.maxrequestsperchild`|`0`
`apache_mpm_worker_module.startservers`|string|`apache_mpm_worker_module.startservers`|`2`
`apache_mpm_worker_module.minsparethreads`|string|`apache_mpm_worker_module.minsparethreads`|`25`
`apache_mpm_worker_module.maxsparethreads`|string|`apache_mpm_worker_module.maxsparethreads`|`75`
`apache_mpm_worker_module.threadlimit`|string|`apache_mpm_worker_module.threadlimit`|`64`
`apache_mpm_worker_module.threadsperchild`|string|`apache_mpm_worker_module.threadsperchild`|`25`
`apache_mpm_worker_module.maxclients`|string|`apache_mpm_worker_module.maxclients`|`150`
`apache_mpm_worker_module.maxrequestsperchild`|string|`apache_mpm_worker_module.maxrequestsperchild`|`0`
`apache_mpm_event_module.startservers`|string|`apache_mpm_event_module.startservers`|`2`
`apache_mpm_event_module.minsparethreads`|string|`apache_mpm_event_module.minsparethreads`|`25`
`apache_mpm_event_module.maxsparethreads`|string|`apache_mpm_event_module.maxsparethreads`|`75`
`apache_mpm_event_module.threadlimit`|string|`apache_mpm_event_module.threadlimit`|`64`
`apache_mpm_event_module.threadsperchild`|string|`apache_mpm_event_module.threadsperchild`|`25`
`apache_mpm_event_module.maxclients`|string|`apache_mpm_event_module.maxclients`|`150`
`apache_mpm_event_module.maxrequestsperchild`|string|`apache_mpm_event_module.maxrequestsperchild`|`0`
