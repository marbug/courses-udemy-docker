# Containers / Create a Nginx (web server) container #

## Stop foreground ##

Press **Control** + **C**

## Run in background ##

    docker container run --publish 80:80 --detach nginx

and it see the unique id like

    2685648e3538b55bb6919b91bf894283cc2decae883879add5dc8686359fc343

## View containers ##

    docker container ls

by default it shows only running containers.

## Stop container ##

    docker container stop 268

i.e. it's enough to type only the part of id if it's unique.

## View all containers ##

    docker container ls -a

## Run in background with name ##

    docker container run --publish 80:80 --detach --name webhost nginx

## See logs ##

    docker container logs webhost

## See top ##

    docker container top webhost

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
