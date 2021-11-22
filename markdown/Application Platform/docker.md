# Docker

## Building docker image
```
$ sudo docker build . -t <reponame>:<tagname> -f <Dockerfile>
```  
  
## Running inside docker container  

```
$ sudo docker run -it --name <name of container> <reponame>:<tagname>
$ sudo docker run —privileged -it —entrypoint /bin/bash
<reponame>:<tagname>
```  

## Remove docker images by force  

```
$ sudo docker rmi -f <docker image id>
```  

## Remove all container, network, cache and image
```
$ sudo docker system prune -a
```

## Copy and load image

```
$ docker save -o  <path for generated tar file> <image name>
$ docker load -i <path to image tar file>
```

## Tag image

```
$ docker image tag <image name> <image name to be tagged>
```