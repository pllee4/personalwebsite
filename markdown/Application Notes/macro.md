# Macros 

## Helper functions
- Sometimes when we are using C languages, we may need some macro function to help us simply the code.
- If there is change of API, we need to only change the macro function.
- This would be useful to maintain legacy code base.
- The syntax can be referred from below.
  
```
#define zTaskCreate(entry_func, thread, stack, p1, p2, p3, priority, options,  \
                    delay)                                                     \
  ({                                                                           \
    k_thread_create(thread, stack, K_THREAD_STACK_SIZEOF(stack), entry_func,   \
                    p1, p2, p3, priority, options, delay);                     \
  })

```

## Token pasting operator

- Some helper function can be much powerful as shown below with token pasting operator.
- The macro would actually help to paste function definition with return value of status.
  
```
#define DecodeTransfer(MsgType, msg, buffer, size)                             \
  ({                                                                           \
    MsgType message = MsgType##_init_clear;                                     \
    bool status = DecodeBufferToMessage(MsgType, &message, buffer, size);      \
    *msg = message;                                                            \
    status;                                                                    \
  })
```

- This pasted code for calling

```
  checkStatus = DecodeTransfer(MyMessage, &msg, buffer, size);
```

- would result in

```
  MyMessageType message = MyMessageType__init_clear;
  bool status = DecodeBufferToMessage(MyMessageType, &message, buffer, size);
  msg = message;
  checkStatus = status;
```