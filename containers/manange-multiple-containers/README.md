# Containers / Manage multiple containers #

## Mysql ##

    docker container run -d -p 3306:3306 --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql

## Apache ##

    docker container run -d -p 8080:80 --name webserver httpd

## Nginx ##

    docker container run -d -p 80:80 --name proxy nginx

## stop ##

    docker container stop db webserver proxy

## remove ##

    docker container rm db webserver proxy

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
