# Containers / Learn Docker networking basics #

## Defaults ##

* Each container connected to a private virtual network "bridge"
* Each virtual network routes through NAT firewall on host IP
* All containers on a virtual network can talk to each other without -p
* Best practice is to create a new virtual network for each app:

    * network "my_web_app" for mysql and php/apache containers
    * network "my_api" for mongo and nodejs containers

## Changes ##

* It's easy to swap out parts to customize
* Make new virtual networks
* Attach containers to more than one virtual network (or none)
* Skip virtual networks and use host IP (--net=host)
* Use different Docker network drivers to gain new abilities

## Commands ##

* See container address

    docker container run -p 80:80 --name webhost -d nginx
    docker container port webhost
    docker container inspect --format '{{ .NetworkSettings.IPAddress }}' webhost

* Show networks

    docker network ls

* Inspect a network

    docker network inspect

* Create a network

    docker network create --driver

* Attach a network to container

    docker network connect

* Detach a network from container

    docker network disconnect

## Useful links ##

* [Docker's --format option](https://docs.docker.com/engine/admin/formatting/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
