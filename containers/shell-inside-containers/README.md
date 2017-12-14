# Containers / Getting a shell inside containers #

## Start new container interactively ##

    docker container run -it --name proxy nginx bash

## Run additional command in existing container ##

    docker container run -it --name ubuntu ubuntu
    docker container exec -it mysql bash

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
