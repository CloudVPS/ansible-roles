# Role haproxy

Will install haproxy packages and hatop.


# Usage:
By default a very basic template is used. It is not recommended to use this config in production. Instead create your custom config or template and use it as described below.

To install the latest haproxy version available in your repo's:

```yaml
- hosts: haproxyhost
- { role: haproxy, haproxy_external_template: files/haproxy/haproxy.cfg.j2 }
```


To install version 1.5 from ppa and use an external configuration file:

```yaml
- hosts: haproxyhost
- { role: haproxy, haproxy_version: 1.5, haproxy_external_file: files/haproxy/haproxy.cfg }
```
  

## Requirements / Dependencies

* None

## Supported system

* Ubuntu

## Installations

No extra steps needed.

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`haproxy_version`|string|`specifie other than OS default version`|``
`haproxy_external_template`|string|`path to a custom config template`|``
`haproxy_external_file`|string|`path to a custom config file (see example below)`|``
`haproxy_error_folder`|string|`folder with haproxy error pages`|``
`haproxy_external_pem`|string|`external pem file for haproxy ssl frontends`|``
`haproxy.http_in`|string|`http frontend ip`|`*`
`haproxy.mysql_vip`|string|`mysql frontend ip`|`*`
`haproxy.mysql_backup_ip`|string|`mysql backend ip`|`127.0.1.100`
`haproxy.mysql_master_ip`|string|`mysql backend ip`|`127.0.1.110`
`haproxy.check_vhost`|string|`vhost name`|`localhost`
`haproxy.realserver_1`|string|`http backend ip`|`127.0.1.1`
`haproxy.realserver_2`|string|`http backend ip`|`127.0.1.2`
`haproxy.admin_password`|string|`stats user password`|`changeme`
`haproxy.stats_listen_ip`|string|`stats frontend ip`|`*`
`haproxy.stats_listen_port`|string|``|`8000`
`name`|string|``|``
`name`|string|``|``
`name`|string|``|``





* Tested on Ubuntu 16.04

sample haproxy.cfg
```
# Managed by ansible, please do not edit manually as your
# changes are overwritten.

global
       log 127.0.0.1   local0 notice
       stats socket     /var/run/haproxy.sock mode 0600 level admin
       maxconn         20000
       user            haproxy
       group           haproxy
       # enable for A+ rating
       ssl-default-bind-ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES128-SHA:AES256-SHA256:AES256-SHA
       tune.ssl.default-dh-param 2048
       daemon
#       nbproc 6
#       cpu-map 1 0
#       cpu-map 2 1
#       cpu-map 3 2
#       cpu-map 4 3
#       cpu-map 5 4
#       cpu-map 6 5
#       stats bind-process 2

defaults
      log             global
      mode            tcp
      option          tcplog
      option          log-health-checks
      retries         3
      maxconn         20000
      timeout http-request 5s  # In order to offer DoS protection, it may be required to lower the maximum accepted time
      timeout connect 5s       # cover one or several TCP packet losses (eg: 4 or 5 seconds).
      timeout client-fin 5s    # avoid keeping connections in FIN_WAIT state for too long
      timeout client  30s      # cover one or several TCP packet losses (eg: 4 or 5 seconds). equal to the server timeout
      timeout server  30s      # cover one or several TCP packet losses (eg: 4 or 5 seconds). equal to the client timeout
      timeout tunnel  1h       # timeout to use with WebSocket and CONNECT




frontend http-in
    mode http
    bind *:80
#    bind *:443 ssl crt /etc/ssl/private/ no-sslv3 crt-ignore-err all strict-sni
#    acl secure dst_port eq 443
#    rsprep ^Set-Cookie:\ (.*) Set-Cookie:\ \1;\ Secure if secure
#    rspadd Strict-Transport-Security:\ max-age=31536000 if secure

#    bind-process 5 6

    option httplog
    option http-server-close
    option forwardfor #adds X-Forwarded-For
    http-request add-header X-Real-IP %[src]
    http-request set-header X-Forwarded-Host %[dst]
    http-request set-header X-Forwarded-Port %[dst_port]
    http-request set-header X-Forwarded-Proto https if { ssl_fc }
    http-request set-header X-Forwarded-Proto http if !{ ssl_fc }

    default_backend appserver


backend appserver
      mode            http
      balance         leastconn
      cookie          SERVERID insert nocache indirect
      #option          httpchk HEAD /health.php HTTP/1.1\r\nHost:\ localhost
      #option          httpchk GET /adServ/placement/id/292/ HTTP/1.1\r\nHost:\ vmg.host
      #http-check      expect rstatus (2|3)[0-9][0-9]

      # 16000000 seconds: a bit more than 6 months
#      http-response set-header Strict-Transport-Security "max-age=16000000; includeSubDomains; preload;"

      server          app1 10.0.0.20:80 check cookie app1 rise 10 fall 3 slowstart 10m
      server          app2 10.0.0.21:80 check cookie app2 rise 10 fall 3 slowstart 10m

      option          redispatch
      retries         10



frontend Statistics
      mode http
      bind *:8000
      option contstats
      default_backend HAProxy-Statistics

      acl to_app1_stats path_beg /app1/stats
      use_backend app1_stats if to_app1_stats

      acl to_app2_stats path_beg /app2/stats
      use_backend app2_stats if to_app2_stats


backend app1_stats
      mode            http
      server          app1 10.0.0.20:8000 check cookie app1
#      acl white_list_app1 src -f /etc/haproxy/whitelist.lst
#      http-request deny if !white_list_app1

backend app2_stats
      mode            http
      server          app2 10.0.0.21:8000 check cookie app2
#      acl white_list_app2 src -f /etc/haproxy/whitelist.lst
#      http-request deny if !white_list_app2

userlist UsersFor_HAProxyStatistics
      group admin users admin
      user admin insecure-password changeme


backend HAProxy-Statistics
      mode http
      stats enable
      stats uri /stats
      stats refresh 10s
      stats show-node
      stats show-legends
      acl AuthOkay_ReadOnly http_auth(UsersFor_HAProxyStatistics)
      acl AuthOkay_Admin http_auth_group(UsersFor_HAProxyStatistics) admin
      stats http-request auth realm HAProxy-Statistics unless AuthOkay_ReadOnly
      stats admin if AuthOkay_Admin

```
