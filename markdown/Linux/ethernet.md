# Ethernet 

## Bring up ethernet interface

- Depending on the operating system, you can check the ethernet interface using command "ifconfig". The example below is setting up enp6s0, some ethernet interface would be called as "eth0"

```
$ sudo ip link set enp6s0 up
```

## Bring down ethernet interface

```
$ sudo ip link set enp6s0 down
```

## Adding address and route

```
$ sudo ip addr add 10.10.0.20 dev enp6s0
$ sudo ip route add 10.10.0.0/24 dev enp6s0
```

## Using telnet

```
$ telnet <ip_address> <port>
```  

```
$ telnet 10.10.0.10 4242
```

## Using netcat

```
$ nc <ip_address> <port> 
```

- TCP
```
$ nc 10.10.0.10 4242
```

- UDP
```
$ nc 10.10.0.10 4242 -u
```