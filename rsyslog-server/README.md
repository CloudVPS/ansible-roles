# Role rsyslog server

* Particularly usefull when using haproxy which only logs via UDP to rsyslog.

## Requirements

* None

## Supported system

* Ubuntu 14.04 - 16.04

## Installation

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|Required|
|----|----|-----------|-------|-------|
`rsyslog_conf_file|file|use custom rsyslog.conf file|`-`|no
`rsyslog_remote`|bool|enable remote udp access to rsyslog server|`False`|no

## Files required

No extra files required

## Dependencies

No role dependencies
