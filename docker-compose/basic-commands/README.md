# Making it easier with Docker Compose: the multi-container tool / Trying out basic compose commands #

## Linux ##

* CLI tool comes with Docker for Windows/Mac, but separate download for Linux

## Commmon ##

* Not a production-grade tool but ideal for local development and test
* Two most common commands are

    * setup volumes/networks and start all containers:

            docker-compose up

    * stop all containers and remove containers/volumes/networks:

            docker-compose down

* If all your projects had a **Dockerfile** and **docker-compose.yml** then "new developer onboarding" would be:

        git clone github.com/some/software
        docker-compose up

## Example ##

* docker-compose.yml

        version: '3'

        services:
          proxy:
            image: nginx:1.13 # this will use the latest version of 1.11.x
            ports:
              - '80:80' # expose 80 on host and sent to 80 in container
            volumes:
              - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
          web:
            image: httpd  # this will use httpd:latest

## Useful links ##

* [docker-compose for Linux](https://github.com/docker/compose/releases)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
