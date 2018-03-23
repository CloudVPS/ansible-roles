# Role elasticsearch
Will install elasticsearch from default repo's and configure basics like cluster.name and node.name.

# Usage

This role needs variables per group in group_vars/
Add in your host_vars/ of group_vars/ the following example:

```yaml
elasticsearch:
  cluster_name: "search1"

```


Include in your playbook like this:

```yaml
- hosts: all
  roles: 
    - elasticsearch
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
`elasticsearch.cluster_name`|string|`Elasticsearch cluster name`|`-`
