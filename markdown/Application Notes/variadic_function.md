# Variadic function

## Template

```
#include <stdio.h>
#include <stdarg.h>

int variadic_addition (int count,...)
{
  va_list args;
  int i, sum;

  va_start (args, count);         /* Save arguments in list. */

  sum = 0;
  for (i = 0; i < count; i++)
    sum += va_arg (args, int);    /* Get the next argument value. */

  va_end (args);                  /* Stop traversal. */
  return sum;
}


int main(){

  // call 1: 4 arguments
  printf("Sum: %d\n", variadic_addition(3, 10, 20, 30));

  //call 2: 6 arguments
  printf("Sum: %d\n", variadic_addition(5, 10, 20, 30, 40, 50));

  return 0;

}
```