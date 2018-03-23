# Role iptables
Will setup iptables configuration in /etc/iptables/ and load them on startup.

# Usage
This module needs variables per host or hostgroup.
Default for a loadbalancer could be as follows.


```yaml
ip4tables:
```

If the loadbalancer is also the gateway (use on traditional platforms) add some NAT rules:
```
  nat:
    # NAT rules for VPC
    - '-A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE -m comment --comment "001 snat for VPC network"'
#    - '-A PREROUTING -d 10.0.0.1/32 -p tcp --dport 123 -j DNAT --to-destination 10.0.0.123:123 -m comment --comment "101 forward port 123"'
```

```
  filter:
    # Allow ICMP traffic
    - '-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT'
    #- '-A INPUT -p icmp -j ACCEPT -m comment --comment "000 accept all icmp"'
    # Allow loopback traffic
    - '-A INPUT -i lo -j ACCEPT -m comment --comment "001 accept all to lo interface"'
    - '-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT -m comment --comment "002 accept related established rules"'
    # Allow VRRP and multicast traffic
    - '-A INPUT -p vrrp -j ACCEPT -m comment --comment "003 accept vrrp protocol"'
    - '-A INPUT -d 224.0.0.0/8 -j ACCEPT -m comment --comment "003 accept multicast protocol"'
    # Allow management and monitoring traffic
    - '-A INPUT -s <<MAGEMENTIP>>/32 -p tcp -m state --state NEW,RELATED,ESTABLISHED -m tcp -m multiport --dports 22,5666,8000,8080 -j ACCEPT'
    # Allow internal management traffic
    - '-A INPUT -s 10.0.0.0/24 -p tcp -m state --state NEW,RELATED,ESTABLISHED -m tcp --dport 22 -j ACCEPT'
    - '-A INPUT -s 10.0.0.0/24 -p tcp -m state --state NEW,RELATED,ESTABLISHED -m tcp --dport 5666 -j ACCEPT'
    # Allow HTTP and HTTPS traffic
    - '-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT'
    - '-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT'

    # Log and drop all other traffic
    - '-A INPUT -i eth0 -j LOG'
    - '-A INPUT -j DROP'

    # Filter outgoing traffic
    - '-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT -m comment --comment "002 accept related established rules"'
    - '-A OUTPUT -p vrrp -j ACCEPT -m comment --comment "003 accept vrrp protocol"'
    - '-A OUTPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED -m tcp -m multiport --dports 80,443,8000,8080 -j ACCEPT'
    - '-A OUTPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED -m tcp --dport 25 -d <<YOURMAILSERVER>> -j ACCEPT'
    - '-A OUTPUT -p udp -m state --state NEW,RELATED,ESTABLISHED -m udp -m multiport --dports 53 -d <<YOURDNSSERVER>>/32 -j ACCEPT'
    - '-A OUTPUT -p udp -m state --state NEW,RELATED,ESTABLISHED -m udp -m multiport --dports 53,514 -d 10.0.0.0/24 -j ACCEPT'
    - '-A OUTPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED -m tcp -m multiport --dports 22,5666,8888 -d 10.0.0.0/24 -j ACCEPT'

    - '-A OUTPUT -j LOG'
    - '-A OUTPUT -j DROP'
#    - '-A FORWARD -j DROP'

ip6tables:
  filter:
    # Allow loopback traffic
    - ' -A INPUT -i lo -j ACCEPT'
    - ' -A OUTPUT -o lo -j ACCEPT'
    # DROP all traffic via policy
    #- ' -P INPUT DROP'
    #- ' -P OUTPUT DROP'
    #- ' -P FORWARD DROP'
    # Allow full outgoing connections
    - ' -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT'
    - ' -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT'
    # Drop all traffic
    - ' -A INPUT -i eth0 -j LOG'
    - ' -A INPUT -i eth0 -j DROP'
```



