# Wireguard Setup on Azure

## Installation on server

```
$ sudo apt-get install wireguard-dkms wireguard-tools
```

```
$ sudo nano /etc/sysctl.conf
```

- uncomment the line

```
net.ipv4.ip_forward=1
```

## Generation of keys for server and client

```
$ sudo -i
$ cd /etc/wireguard
$ wg genkey | tee server_private_key | wg pubkey > server_public.key
```

## Configuration file for server

- create /etc/wireguard/wg0.conf as following
- for this example, the IP address of server used is 100.0.0.1
- make sure the ip address is not having same subnet as the internet source of the server for example eth0.
- DO NOT use IP 100.0.0.1 if you realize it is having same subnet as eth0 as shown below

```
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 100.0.0.4  netmask 255.255.255.0  broadcast 100.0.0.255

```

```
[Interface]
Address = 100.0.0.1/24
SaveConfig = true
PostUp = /etc/wireguard/iptable/rules.sh A
PostDown = /etc/wireguard/iptable/rules.sh D
ListenPort = 51820
PrivateKey = <server_private_key>

[Peer]
PublicKey = <client_public_key>
AllowedIPs = 100.0.0.2/32
```

- the ListenPort depends on the your UDP port allowed at firewall.
- example of firewall at Azure
  ![firewall](https://user-images.githubusercontent.com/42335542/148547297-0d7d7963-a187-4ff0-ac5a-313f8daeb37a.png)
- create /etc/wireguard/iptable/rules.sh.

```
#!/bin/bash
IN_IFACE="eth0"                  # NIC connected to the internet
WG_IFACE="wg0"                   # WG NIC
SUB_NET="100.0.0.0/24"            # WG IPv4 sub/net aka CIDR
WG_PORT="51820"                  # WG udp port

# handle argument
ARG=$1
if [ "$ARG" = "A" ]
then
echo "Appending rules..."
elif [ "$ARG" = "D" ]
then
echo "Deleting rules..."
else
echo "Invalid operation!"
echo "Usage: ./rules.sh A or ./rules.sh D>"
exit 1
fi

# track VPN connection and allow related/established connections
/sbin/iptables -$ARG INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -$ARG FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# allow incoming VPN traffic on the listening port
/sbin/iptables -$ARG INPUT -p udp -m udp --dport $WG_PORT -m conntrack --ctstate NEW -j ACCEPT

# allow both TCP and UDP recursive DNS traffic
/sbin/iptables -$ARG INPUT -s $SUB_NET -p tcp -m tcp --dport 53 -m conntrack --ctstate NEW -j ACCEPT
/sbin/iptables -$ARG INPUT -s $SUB_NET -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT

# allow forwarding of packets between interfaces
/sbin/iptables -$ARG FORWARD -i $WG_IFACE -o $WG_IFACE -m conntrack --ctstate NEW -j ACCEPT
/sbin/iptables -$ARG FORWARD -i $IN_IFACE -o $WG_IFACE -m conntrack --ctstate NEW -j ACCEPT
/sbin/iptables -$ARG FORWARD -i $WG_IFACE -o $IN_IFACE -m conntrack --ctstate NEW -j ACCEPT

######

# set up nat (if allowing clients to access Internet)
/sbin/iptables -t nat -$ARG POSTROUTING -s $SUB_NET -o $IN_IFACE -j MASQUERADE

######

# exit script
echo "Done"
exit 0
```

## Configuration for DNS

- Install unbound to provide DNS

```
$ apt-get install unbound unbound-host dnsutils
```

- check number of threads by running 
  
```
lscpu | egrep 'Model name|Socket|Thread|NUMA|CPU\(s\)'
```
- You will need to fill in num-threads in the next configuration
  
```
$ curl -o /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache
$ chown -R unbound:unbound /var/lib/unbound
$ cd /etc/unbound/unbound.conf.d
$ nano unbound_srv.conf
```

```
server:

  num-threads: 1

  #Enable logs
  verbosity: 1

  #list of Root DNS Server
  root-hints: "/var/lib/unbound/root.hints"

  #Use the root servers key for DNSSEC
  #auto-trust-anchor-file: "/var/lib/unbound/root.key"

  #Respond to DNS requests on all interfaces
  interface: 0.0.0.0
  max-udp-size: 3072

  #Authorized IPs to access the DNS Server
  access-control: 0.0.0.0/0                 refuse
  access-control: 127.0.0.1                 allow
  access-control: 100.0.0.0/24               allow

  #not allowed to be returned for public internet  names
  private-address: 100.0.0.0/24

  # Hide DNS Server info
  hide-identity: yes
  hide-version: yes

  #Limit DNS Fraud and use DNSSEC
  harden-glue: yes
  harden-dnssec-stripped: yes
  harden-referral-path: yes

  #Add an unwanted reply threshold to clean the cache and avoid when possible a DNS Poisoning
  unwanted-reply-threshold: 10000000

  #Have the validator print validation failures to the log.
  val-log-level: 1

  #Minimum lifetime of cache entries in seconds
  cache-min-ttl: 1800

  #Maximum lifetime of cached entries
  cache-max-ttl: 14400
  prefetch: yes
  prefetch-key: yes
```

- Restart and enable unbound service

```
$ systemctl restart unbound
$ systemctl enable unbound
```

- You may need to disable the default DNS resolver if unbound fails to start with an error message saying port 53 has been binded to another process

```
% use netstat to check whether port 53 has been binded 
$ netstat -lutnp

% disable systemd-resolved
$ systemctl stop systemd-resolved.service
$ systemctl disable systemd-resolved.service

% fix hostname
% if you have seen error like "unable to resolve host <your_hostname>: Name or service not known"
$ nano /etc/hosts

% add your hostname
127.0.0.1 <your_hostname>
```

## Wireguard service on server

```
$ wg-quick up wg0
$ systemctl enable wg-quick@wg0.service
```

- You can test your DNS setup with the following commands and you should expect to see similar results returned

```
$ nslookup www.google.com 100.0.0.1

Server:		100.0.0.1
Address:	100.0.0.1#53

Non-authoritative answer:
Name:	www.google.com
Address: 74.125.24.103
```

## Setting up clients
### Server
```
$ wg genkey | tee client_private.key | wg pubkey > client_public.key
```
```
$ wg set wg0 peer <new_client_public_key> allowed-ips <new_client_vpn_IP>/32
```
```
$ wg addconf wg0 <(wg-quick strip wg0)
```
- Set wg0 down then up again in order to take effect

### Client
- Install dependencies
```
$ sudo apt install wireguard resolvconf

```
- Assuming the client vpn IP is 100.0.0.2
- Create configuration file as below

```
$ sudo -i
$ nano /etc/wireguard/wg0.conf
```

```
[Interface]
Address = 100.0.0.2/32
PrivateKey = <client_private_key>
DNS = 100.0.0.1

[Peer]
PublicKey = <server_public_key>
Endpoint = <server_public_IP>:<ListenPort>
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

- Bring up the connection
```
$ sudo wg-quick up wg0
$ sudo systemctl enable wg-quick@wg0.service
```