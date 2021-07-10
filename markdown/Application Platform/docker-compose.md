# Docker Compose

## Template

```
version: '3.3'
services:
  iot:
    privileged: true
    image: <docker-image>
    logging:
        driver: "json-file"
        options:
            max-file: "5"
            max-size: "10m"
    network_mode: "host"
    volumes:
      - "<host directory>:<mapped directory>"
    command: [<argument>, <mapped directory>]
    restart: unless-stopped
```