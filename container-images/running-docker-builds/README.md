# Container images / Building images: running docker builds #

In the same directory (with **Dockerfile**)...

## Create local image ##

    docker image build -t customnginx .

## View image id ##

    docker image ls

## Add port ##

Add **8080** to **EXPOSE** in **Dockerfile**:

    EXPOSE 80 443 8080

## Rebuild ##

    docker image build -t customnginx .

Rebuilding will be much faster because of layers.

## View image id ##

    docker image ls

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
