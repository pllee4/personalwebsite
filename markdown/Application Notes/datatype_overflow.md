# Datatype overflow

- Sometimes when we choose to use **unsigned** datatype when there is no negative value required, and also to achieve greater range of value for the same size of variable.

- However, we should be careful for the operation for unsigned datatype as we have accidentally provided chance to break our code if we are not handling well.

- In this example, I am using uint32_t for timestamp. 

- Considered below, I have few simple lines to compare the current timestamp and timestamp from sensor

```
bool CheckSensorAlive(Sensor *sensor) {
 static uint32_t current_time_stamp;
// assuming the timestamp of sensors is also uint32_t and would be updated every time the sensor got new data
 if (current_time_stamp - sensor->time_stamp > SENSOR_STILL_ALIVE_TIME)
    return false;
 current_time_stamp += SENSOR_UPDATE_RATE;
 return true;
}
```

- The code above is written according to the logic that previous timestamp would keep storing value of timestamp from sensor. Assuming that the sensor has stopped updating for a long time, or considered as not alive, the value of current_time_stamp would be bigger than timestamp sensor. Thus, we could conclude the sensor is no longer "alive" 

- Nevertheless, due to the datatype used which is unsigned, some unexpected event may happen for the code above.
 
- If the timestamp has a initial value which is smaller than SENSOR_STILL_ALIVE_TIME and got updated before the function above is called,  supposed it should not indicate sensor is not alive, but due to the subtraction between uint32_t would never result in negative value, the function above may return false.

- In other words, **either current_time_stamp is 0 or when sensor->timestamp has a greater value, the function may return false as well**.

- Hence, it would be safer to tweak the function above as shown in below.

```
bool CheckSensorAlive(Sensor *sensor) {
 static uint32_t current_time_stamp;
// assuming the timestamp of sensors is also uint32_t and would be updated every time the sensor got new data
 if (current_time_stamp > SENSOR_STILL_ALIVE_TIME + sensor->time_stamp)
    return false;
 current_time_stamp += SENSOR_UPDATE_RATE;
 return true;
}
```

- In this case, same functionality is remained with safer precaution for operation of unsigned int.

- It may be very simple, but sometimes when developing code, we may accidentally write "unsafe" code as above.
