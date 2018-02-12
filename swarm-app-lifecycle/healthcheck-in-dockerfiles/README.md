# Swarm App Lifecycle / Healthchecks in Dockerfiles #

* **HEALTHCHECK** was added in 1.12
* Supported in Dockerfile, Compose YAML, docker run, and Swarm Services
* Docker engine will **exec** the command in the container

    * e.g. **curl localhost**

* It expects **exit 0** (OK) or **exit 1** (Error)
* Three container states:

    * starting
    * healthy
    * unhealthy

* Much better than "is binary still running?"
* Not an external monitoring replacement

## Main info ##

* Healthcheck status shows up in

    docker container ls
    
* Check last 5 healthchecks with

    docker container inspect    

* Docker run does nothing with healthchecks

* Services will replace tasks if they fail healthcheck

* Service updates wait for them before continuing

## Example ##

    docker run \
        --health-cmd="curl -f localhost:9200/_cluster/health || false" \
        --health-interval=5s \
        --health-retries=3 \
        --health-timeout=2s \
        --health-start-period=15s \
        elasticsearch:2

## Dockerfile examples ##

* Options for healthcheck command

    * (default: 30s) 

            --interval=DURATION
    
    * (default: 30s) 

            --timeout=DURATION

    * (default: 0s in 17.09+) 

            --start-period=DURATION

    * (default: 3) 

            --retries=N

* Basic command using default options

        HEALTHCHECK curl -f http://localhost/ || false

* Custom options with the command

        HEALTHCHECK --timeout=2s --interval=3s --retries=3 \
        CMD curl -f http://localhost/ || exit 1

## Postgres Dockerfile example ##

    FROM postgres
    
    # specify real user with -U to prevent errors in log
    
    HEALTHCHECK --interval=5s --timeout=3s \
    CMD pg_isready -U postgres || exit 1

## In Compose/Stack files ##

    version: "2.1"
    services:
        web:
            image: nginx
            healthcheck:
                test: ["CMD", "curl", "-f", "http://localhost"]
                interval: 1m30s
                timeout: 10s
                retries: 3
                start_period: 1m # version 3.5 minimum

## Postgres container example ##

    docker container run --name p1 -d postgres
    docker container run --name p2 -d --health-cmd="pg_isready -U postgres || exit 1" postgres

## Postgres service example ##

    docker service create --name p1 postgres
    docker service create --name p2 --health-cmd="pg_isready -U postgres || exit 1" postgres

## Useful links ##

* [PHP Laravel Good Defaults with Docker](https://github.com/BretFisher/php-docker-good-defaults)
* [HEALTHCHECK in Dockerfile (Docker Docs)](https://docs.docker.com/engine/reference/builder/#healthcheck)
* [Healthcheck in Compose files (Docker Docs)](https://docs.docker.com/compose/compose-file/#healthcheck)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
