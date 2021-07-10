# Systemd Service

## Template

- systemd service to run docker-compose
  
```
[Unit]
Description=My Systemd Services
Requires=docker.service network-online.target
After=docker.service network-online.target
StartLimitIntervalSec=0

[Service]
WorkingDirectory=<directory of docker-compose>
ExecStartPre=/bin/bash <any pre start script>
ExecStart=/usr/local/bin/docker-compose up
ExecStop=/usr/local/bin/docker-compose down
Restart=always
RestartSec=60

[Install]
WantedBy=multi-user.target
```

## Enable systemd service

- You can create a file by using the template above accordingly, let say named myssytemd.service

- Copy the service into /etc/systemd/system and enable it

- After it is enabled and is started, the service would be running automatically even after the system reboots.
  
```
$ sudo cp myssytemd.service /etc/systemd/system
$ sudo systemctl enable myssytemd.service
```

## Start systemd service

```
$ sudo systemctl start myssytemd.service
```

## Stop systemd service

```
$ sudo systemctl stop myssytemd.service
```

## Disable systemd service

```
$ sudo systemctl disable myssytemd.service
```

## Check log of systemd service

```
$ sudo journalctl -u myssytemd.service -f
```