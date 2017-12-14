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



TODO

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
