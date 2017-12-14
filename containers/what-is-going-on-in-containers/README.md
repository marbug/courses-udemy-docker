# Containers / What's going on in containers #

## Run containers ##

    docker container run -d --name mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql
    docker container run -d --name nginx nginx

## Process list in one container ##

    docker container top mysql
    docker container top nginx

## Details of one container config ##

    docker container inspect mysql
    docker container inspect nginx

## Performance stats for all containers ##

    docker container stats

or

    docker container stats mysql
    docker container stats nginx

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
