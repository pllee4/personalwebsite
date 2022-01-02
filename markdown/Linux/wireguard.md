# Wireguard Setup on Azure

## Installation on server

```
$ sudo apt-get install wireguard-dkms wireguard-tools linux-headers-$(uname -r)
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

```
[Interface]
Address = 10.1.0.1/24
SaveConfig = true
PostUp = /etc/wireguard/iptable/rules.sh A
PostDown = /etc/wireguard/iptable/rules.sh D
ListenPort = 51820
PrivateKey = <server_private_key>

[Peer]
PublicKey = <client_public_key>
AllowedIPs = 10.1.0.2/32
```

- the ListenPort depends on the your UDP port allowed at firewall.
- create /etc/wireguard/iptable/rules.sh.

```
#!/bin/bash
IN_IFACE="eth0"                  # NIC connected to the internet
WG_IFACE="wg0"                   # WG NIC
SUB_NET="10.1.0.0/24"            # WG IPv4 sub/net aka CIDR
WG_PORT="51800"                  # WG udp port

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
$ sudo apt-get install unbound unbound-host dnsutils
```

```
$ curl -o /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache
$ chown -R unbound:unbound /var/lib/unbound
$ cd /etc/unbound/unbound.conf.d
$ nano unbound_srv.conf
```

```
server:

  num-threads: 4

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
  access-control: 10.1.0.0/24               allow

  #not allowed to be returned for public internet  names
  private-address: 10.1.0.0/24

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
$ sudo systemctl stop systemd-resolved
$ sudo systemctl disable systemd-resolved
```

- You can test your DNS setup with the following commands and you should expect to see similar results returned

```
$ nslookup www.google.com 10.1.0.1

Server:		10.1.0.1
Address:	10.1.0.1#53

Non-authoritative answer:
Name:	www.google.com
Address: 74.125.24.103
```

## Wireguard service on server

```
$ sudo wg-quick up wg0
$ sudo systemctl enable wg-quick@wg0.service
```

## Setting up clients
### Server
```
$ wg genkey | tee client_private.key | wg pubkey > client_public.key
```
```
$ wg set wg0 peer <new_client_public_key> allowed-ips <new_client_vpn_IP>/32
```

### Client
- Install dependencies
```
$ sudo apt install wireguard resolvconf

```
- Assuming the client vpn IP is 10.1.0.2
- Create configuration file as below

```
$ sudo -i
$ nano /etc/wireguard/wg0.conf
```

```
Copy
[Interface]
Address = 10.1.0.2/32
PrivateKey = <client_private_key>
DNS = 10.1.0.1

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