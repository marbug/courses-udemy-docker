# Containers #

* [Check versions of our docker cli and engine](check-versions/README.md)
* [Create a Nginx (web server) container](nginx-container/README.md)
* [Learn common container management commands](commands/README.md)
* [Windows containers](windows/README.md)
* [Manage multiple containers](manange-multiple-containers/README.md)
* Learn Docker networking basics

## Image vs Container ##

* An **image** is the application we want to run
* A **container** is an instrance of that image running as a process
* You can have many **containers** running off the same image
* In this lecture our image will be the Nginx web server
* Docker's default image "registry" is called [Docker Hub](hub.docker.com)

## Container vs VM ##

* They are just processes
* Limited to what resources they can access
* Exit when process stops

## Useful info ##

* Run mongo

        docker run --name mongo -d mongo

* [Mike Coleman (Docker Employee) "Docker for the Virtualization Admin" eBook](https://github.com/mikegcoleman/docker101/blob/master/Docker_eBook_Jan_2017.pdf)

* [Docker Internals: cgroups, namespaces, and beyond (YouTube)](https://www.youtube.com/watch?v=sK5i-N34im8)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
