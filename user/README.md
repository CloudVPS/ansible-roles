# Role user

A role to create users.

# Usage

Include in role:

```yaml
- hosts: all
  role:
    - user
  
```

In group_vars or host_vars:

```yaml
group:
  - groupname

user:
  - name: piet
    password: "(See link below)"
    home: /home/piet
    createhome: yes
    groups: automotive
    state: present
    shell: /bin/bash
    generate_ssh_keys: yes
    sshpubkey: "ssh-rsa AA...BB"
    sshpubkeys: 
      - "ssh-rsa AA...BB"
      - "ssh-rsa AA...BB"
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
`name`|string|username|`-`
`password`|string|password|`-`
`update_password`|string|update_password|`on_create`
`home`|string|homefolder|`-`
`createhome`|bool|optional|`yes`
`groups`|string|optional|`users`
`state`|string|optional|`present`
`shell`|string|optional|`/bin/bash`
`generate_ssh_keys`|bool|optional|`no`
`sshpubkey`|string|optional|`"ssh-rsa AA...BB"`
`sshpubkeys`|list|optional|`"- ssh-rsa AA...BB"`


## Generate user password hash:

pwgen -s -1 | tee pwd | mkpasswd -m sha-512 -s ;cat pwd

http://docs.ansible.com/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module
