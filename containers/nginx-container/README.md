# Containers / Create a Nginx (web server) container #

Run the following in terminal:

    docker container run --publish 80:80 nginx

and see something like

    Unable to find image 'nginx:latest' locally
    latest: Pulling from library/nginx
    e7bb522d92ff: Pull complete
    0f4d7753723e: Pull complete
    91470a14d63f: Pull complete
    Digest: sha256:2ffc60a51c9d658594b63ef5acfac9d92f4e1550f633a3a16d898925c4e7f5a7
    Status: Downloaded newer image for nginx:latest

open [localhost](http://localhost/) in browser and see **Welcome to nginx!** page.

## Details ##

* Downloaded image **nginx** from Docker Hub
* Started a new container from that image
* Opened port 80 on the host IP
* Routes that traffic to the container IP, port 80

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

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
