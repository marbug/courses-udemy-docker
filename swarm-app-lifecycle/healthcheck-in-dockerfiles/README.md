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

TODO

## Useful links ##

* [PHP Laravel Good Defaults with Docker](https://github.com/BretFisher/php-docker-good-defaults)
* [HEALTHCHECK in Dockerfile (Docker Docs)](https://docs.docker.com/engine/reference/builder/#healthcheck)
* [Healthcheck in Compose files (Docker Docs)](https://docs.docker.com/compose/compose-file/#healthcheck)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
