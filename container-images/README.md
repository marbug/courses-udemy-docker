# Container images #

## What's in an image (and what isn't) ##

* App binaries and dependecies
* Metadata about the image data and how to run the image
* Official definition:

    * An image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime

## Using Docker Hub images ##

* go to [hub.docker.com](hub.docker.com)
* search for **nginx**
* result must be a single name and has **official** type

Download latest:

    docker pull nginx

Download specific version:

    docker pull nginx:1.10.3

See images list:

    docker image ls

## Images and their layers ##

    docker history nginx:latest
    docker history mysql

Files are stored for layers. So there is no need to download each image from scratch: only layers will be downloaded.

Image detailed info:

    docker image inspect nginx

## Image tagging and pushing to Docker Hub ##

* Create an image (my one from another one):

        docker image tag nginx marabug/nginx

* Publish image:

        docker image push marabug/nginx

* Create a tag:

        docker image tag marabug/nginx marabug/nginx:1.0

* Publish tag:

        docker image push marabug/nginx:1.0

## Building images: the Dockerfile basics ##

Read [here](dockerfile-basics/README.md)

## Building images: running docker builds ##

Read [here](running-docker-builds/README.md)

## Building images: extending official images ##

Read [here](extend-official-images/README.md)

## Useful links ##

* [Official Docker Image Specification](https://github.com/moby/moby/blob/master/image/spec/v1.md)
* [List of Official Docker Images](https://github.com/docker-library/official-images/tree/master/library)
* [Images and Containers From Docker Docs](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
