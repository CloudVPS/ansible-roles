# Role nfs-client
Will do all sorts of amazing stuff like 
- Create mount point
- Install nfs client
- Add nfs mount to fstab

# Usage
Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - {role: nfs-client, mountpoint: "/mnt/nfs/", mountpoint_owner: "root", nfs_export: "10.0.0.123:/mnt/export"}
```

Or add in your host_vars/ of group_vars/ the following example:

```yaml
mountpoint: "/mnt/nfs/"
mountpoint_owner: "root"
nfs_export: "10.0.0.123:/mnt/export"
```


## Requirements / Dependencies

* Available nfs export.

## Supported system

* Ubuntu 12.04 - 16.04

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Optional|
|----|----|-----------|-------|-------|
`mountpoint`|string|``|``|`yes`|
`mountpoint_owner`|string|``|``|`yes`|
`nfs_export`|string|``|``|`yes`|
