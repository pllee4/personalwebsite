# Building docker image
```
$ sudo docker build . -t <reponame>:<tagname> -f <Dockerfile>
```  
  
# Running inside docker container  

```
$ sudo docker run -it --name <name of container> <reponame>:<tagname>
```  
  
# Remove docker images by force  

```
$ sudo docker rmi -f <docker image id>
```  

# Remove all container, network, cache and image
```
$ sudo docker system prune -a
```