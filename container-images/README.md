# Container images #

* [What's in an image (and what isn't)](what-is-in-an-image/README.md)
* [Using Docker Hub images](using-docker-hub-images/README.md)

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
