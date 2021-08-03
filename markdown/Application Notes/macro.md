# Macro

## Helper functions
- Sometimes when we are using C languages, we may need some macro function to help us simply the code
- The syntax can be referred from below.
  
```
#define zTaskCreate(entry_func, thread, stack, p1, p2, p3, priority, options,  \
                    delay)                                                     \
  ({                                                                           \
    k_thread_create(thread, stack, K_THREAD_STACK_SIZEOF(stack), entry_func,   \
                    p1, p2, p3, priority, options, delay);                     \
  })

```