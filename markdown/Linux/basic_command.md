# Basic commands

- All the commands below are tested under Ubuntu 18.04.5 LTS
  
## To check disk size 

```
$ df -lh
```

## To check specific size of directory

```
$ du -sh /directory
```

## Potential disk size overflow
- If you have systemd service running and with logs, the disk space maybe used up a lot when something wrong going on the service. 

- You can check the size of syslog

```
$ du -sh /var/log/syslog*
```

- If there is a very big size syslog, that means most of the disk space usage is caused by the syslog

- You can limit the size of log or rotate the log by editing rsyslog located at /etc/logrotate.d/

```
$ sudo nano /etc/logrotate.d/rsyslog
```

- Example below is to limit to size of 100k and rotate for 7 logs in total
  
```
/var/log/syslog
{
    rotate 7
    size 100k
    daily
}
```

- However, this is just a temporary workaround, you should check why which program is generating big size of syslog

- Restart the service 
  
```
$sudo systemctl restart rsyslog.service
```

- Sometimes, the error message from ROS may generate big size of log as well. 

- You can check using the command

```
$ cd
$ du -sh .ros/log
```

## To check saved password for Wifi 

```
$ cd /etc/NetworkManager/system-connections
$ sudo cat <saved_network_connection>
```

## Symlink

### To create symlink
```
$ ln -s <path to the file/folder to be linked> <the path of the link to be created>
```

- -s flag means the link is soft, without -s, by default it would be hard link

### To remove symlink

```
$ unlink <path-to-symlink>
```

or

```
$ rm <path-to-symlink>
```

## Swap memory

### Check swap memory

```
$ free -m
```

### Clear swap memory

- we can cycleoff the swap memory but turn it off and on again

```
$ sudo swapoff -a
$ sudo swapon -a
```

## Scan ip address of devices

### Dependencies

```
$ sudo apt install nmap
```

### Scan

```
$ sudo nmap -sn <ip_address>/24 // for example 192.168.10.0/24
```

## Add user to dialout

```
$ sudo usermod -a -G dialout $USER
```

## Change attribute of file

### List attributes
```
$ lsattr <directory> -la
```

### Add / delete attribute of file

```
$ sudo chattr +i <directory>
$ sudo chattr -i <directory>
```