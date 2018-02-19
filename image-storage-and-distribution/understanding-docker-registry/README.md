# Courses: Udemy "Docker Mastery: The Complete Toolset From a Docker Captain" / Container Registries: Image Storage and Distribution / Understanding Docker Registry #

## About ##

* A private image registry for your network
* Part of the docker/distribution GitHub repo
* The de facto in private containers registries
* Not as full featured as Hub or others, no web UI, basic auth only
* At its core: a web API and storage system, written in Go
* Storage supports local, S3/Azure/Alibaba/GoogleCloud and OpenStack Swift

## Task ##

* Look in section resources for links to:

    * Secure your Registry with TLS
    * Storage cleanup via Garbage Collection
    * Enable Hub caching via **--registry-mirror**

## Useful links ##

* [Docker Distribution on GitHub](https://github.com/docker/distribution)
* [Registry Configuration Docs](https://docs.docker.com/registry/configuration/)
* [Registry Garbage Collection](https://docs.docker.com/registry/garbage-collection/)
* [Use Registry As A "Mirror" of Docker Hub](https://docs.docker.com/registry/recipes/mirror/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
