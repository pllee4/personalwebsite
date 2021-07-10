# Raspberry Pi 4

- All the commands below are tested under Debian Buster 10

## Wpa_supplicant.conf

- For a fresh OS, you may need to create or edit the wpa_supplicant.conf in order for the Raspi to be connected to Wifi after its startup

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
ap_scan=1
update_config=1

network={
	ssid="<Name of your wireless LAN>"
	psk="<Password for your wireless LAN>"
}
```

## Clean up space 

- Sometimes, you would like to clean up space of SD card
- You can uninstall some unnecessary package and do some cleaning

```
$ sudo apt-get purge wolfram-engine libreoffice* scratch -y
$ sudo apt-get clean
$ sudo apt-get autoremove -y
```

## Enable I2C

- go to /boot/config.txt and change to the following:

```
# Uncomment some or all of these to enable the optional hardware interfaces
dtparam=i2c_arm=on
#dtparam=i2s=on
#dtparam=spi=on
```

## Detect I2C 

- Install tools for I2C

```
$ sudo apt-get install -y i2c-tools
```

- Scan I2C devices

```
$ sudo i2cdetect -y 1
```

## Enable UART1

- To enable UART, go to /boot/cmdline.txt and removed the line "console=serial0,115200"
- It should become like the following:
  
```
console=tty1 root=/dev/mmcblk0p7 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait quiet splash plymouth.ignore-serial-consoles
```

- go to /boot/config.txt and add 

```
[all]
enable_uart=1
```

```
$ sudo systemctl stop serial-getty@ttyS0.service
$ sudo systemctl disable serial-getty@ttyS0.service
```

## Use default uart TX0, RX0

```
$ sudo chmod 0666 /dev/ttyS0
```

## References
1. https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-i2c
