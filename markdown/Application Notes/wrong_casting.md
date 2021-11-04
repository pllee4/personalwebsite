# Wrong Casting

- Whenever we are doing explicit casting, we have to be very careful.
- From the example below, sensor_distance will not have the same value with sensor_dis.
  
```
#include <stdio.h>

int main()
{
    int sensor_dis[4] = {1, 2, 3, 4};
    float *sensor_distance;
    sensor_distance = (float *)sensor_dis;
    for (int i = 0; i < 4; i++)
        printf("%.2f\n", sensor_distance[i]);

    return 0;
}
```