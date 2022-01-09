# SSH

- Sometimes it is very convenient to transfer files through local network.
- This could be done by rsync, scp, sftp.
- Nevertheless the host must have openssh-server installed.

## Rsync

- Sometimes rsync is preferred than scp and sftp as it is able to copy hidden files most of the time.
  
```
$ rsync -avzhe ssh <username>@<ip>:/<PATH_TO_BE_COPIED> <DESTINATION_PATH>
```

## Scp

```
$ scp <PATH_TO_BE_COPIED> <username>@<ip>:/<DESTINATION_PATH> 
```

- by installing sshpass, the password can be embedded in the command as well
  
```
$ sshpass -p <PASSWORD> scp /<PATH_TO_BE_COPIED> <username>@<ip>:/<DESTINATION_PATH> 
```

## Sftp

- To get files from a host, sftp is a good choice
  
```
$ sftp <username>@<ip>
$ get -r <PATH_TO_BE_COPIED> <DESTINATION_PATH>
```

## References
1. https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/