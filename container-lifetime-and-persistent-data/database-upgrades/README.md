# Container lifetime and persistent data / Database upgrades with named volumes #

* Database upgrade with containers
* Create a **postgres** container with named volume psql-data using version **9.6.1**
* Use Docker Hub to learn **VOLUME** path and versions needed to run it
* Check logs, stop container
* Create a new **postgres** container with same named volume using ***9.6.2**
* Check logs to validate

**Note:** This only works with patch versions, most SQL DBs require manual commands to upgrade DBs to major/minor versions, i.e. it's a DB limitation not a container one

## Create 9.6.1 ##

    docker container run -d --name psql -v psql:/var/lib/postgresql/data postgres:9.6.1

## See logs ##

    docker container logs -f psql

**Ctrl** + **C**

## Stop ##

     docker container stop psql

## Create 9.6.2 ##

    docker container run -d --name psql2 -v psql:/var/lib/postgresql/data postgres:9.6.2

## Check volume ##

Run

    docker volume ls

and find **psql** volume.

## See logs ##

    docker container logs psql2

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
