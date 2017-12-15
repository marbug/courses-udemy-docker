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

TODO

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
