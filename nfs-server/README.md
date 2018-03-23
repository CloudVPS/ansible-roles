# Role nfs-server
Will install nfs server and create export.

# Usage

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - { role: nfs-server, nfs_exports: files/fileserver/nfs/exports }
```

Create a exports file like
```
/mnt/export     10.0.0.0/24(rw,no_root_squash,no_subtree_check)
```

## Requirements / Dependencies

* None

## Supported system

* Ubuntu

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Optional|
|----|----|-----------|-------|-------|
`none`|string|``|``|`yes`|