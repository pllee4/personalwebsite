# Controller Area Network (CAN)

## Bring up CAN interface

- The bitrate would be dependent on the hardware capabilities of the USB to CAN converter. The example below is setting up bitrate of 500Kbit/s
  
```
$ sudo ip link set can0 up type can bitrate 500000
```

## Bring down CAN interface

- If you would like to bring down the interface
  
```
$ sudo ip link set can0 down
```

## Check whether CAN interface is enabled

```
$ ifconfig
```

- You would see similar things like below:
  
```
can0: flags=193<UP,RUNNING,NOARP>  mtu 16
```

## Send CAN frame

- To send can frame of id 123 and data of AA, BB, CC, DD, EE, FF 

```
$ cansend can0 123#AABBCCDDEEFF
```

## Receive CAN frame

- If you open another terminal and type the following you can see the dumping of can frame

```
$ candump can0
```

- From the previous sending command, you should be able to see something like below:

```
can0 123 [7] AA BB CC DD EE FF
```

## CAN filter mask 

- If you would like to filter certain CAN frame, you can do so by using filter mask. 
- Since the filter mask would be 29 bits in total, to filter exact CAN Id for example 0x123, it will be like following:

```
$ candump can0,123:1fffffff
```

- If you would like to filter CAN Id for 0x12x, it would be like following:

```
$ candump can0,123:1ffffff0
```

