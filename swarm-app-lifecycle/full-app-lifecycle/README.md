# Swarm App Lifecycle / Full App Lifecycle: Dev, Build and Deploy With a Single Compose Design #

* Single set of Compose files for

    * Local **docker-compose up** development environment
    * Remote **docker-compose up** CI environment
    * Remote **docker stack deploy** production environment

## Files ##

* **docker-compose.override.yml**
* **docker-compose.prod.yml**
* **docker-compose.test.yml**
* **docker-compose.yml**
* **Dockerfile**
* **psql-fake-password.txt**

## TODO ##

TODO

## Useful links ##

* [Using Multiple Compose Files (Docker Docs)](https://docs.docker.com/compose/extends/#multiple-compose-files)
* [Using Compose Files In Production (Docker Docs)](https://docs.docker.com/compose/production/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
