# Disk

- The commands below are related to disk or boot up

## Fstab 
- can be edited using command of `sudo nano /etc/fstab`

### Reference to mount other disk
  
```
<file system> <mount point>   <type>  <options>       <dump>  <pass>
```

```
UUID=467031ef-c93b-4fb2-a825-0157f3606d45 /mnt/nvme0n1p7 ext4 auto,user,rw 0 0
/mnt/nvme0n1p7/pinloon/dev_ws /home/pinloon/dev_ws ext4 auto,user,rw 0 0
```

### Reference to mount Window's shared drive

```
//sg-drive/Shared_Drive /home/pinloon/mnt/win_shared_folder cifs credentials=/etc/win-credentials,auto,user,uid=1000,gid=1000,file_mode=0755,dir_mode=0755,rw 0 0
```

- The credential files of `/etc/win-credentials`

```
username=<your window's username> 
password=<your window's password>
domain=<your group's domain>
```

## Clone disk using dd

```
$ sudo dd if=/dev/old of=/dev/new status=progress bs=64K conv=noerror,sync
```

## Off Nvidia driver during boot up

- Sometimes during boot up, you may see the error of "ima: error communicating to tpm chip" followed by hanging of screen and the screen would not be able to display properly

- Press "E" while before entering Ubuntu and press "F10" after edit
- find "quite splash" then add "nomodeset" after it