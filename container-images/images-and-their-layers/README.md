# Container images / Images and their layers #

    docker history nginx:latest
    docker history mysql

Files are stored for layers. So there is no need to download each image from scratch: only layers will be downloaded.

Image detailed info:

    docker image inspect nginx

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
