# Making it easier with Docker Compose: the multi-container tool / About #

* Why: configure relationships between containers
* Why: save our docker container run settings in easy-to-read file
* Why: create one-liner developer environment startups

* Comprised of 2 separate but related things
    1. YAML-formatted file that describes our solution options for
        * containers
        * networks
        * volumes
    2. A CLI tool **docker-compose** used for local dev/test automation with those YAML files

## docker-compose.yml ##

* Compose YAML format has it's own versions: 1, 2, 2.1, 3, 3.1
* YAML file can be used with docker-compose command for local docker automation or ...
* With **docker** directly in production with Swarm (as of v1.13)

See:

    docker-compose --help

**docker-compose.yml** is default filename, but any can be used with **docker-compose -f**

### Example of v2 ###

    version: '2'

    # same as
    # docker run -p 80:4000 -v $(pwd):/site bretfisher/jekyll-serve

    services:
      jekyll:
        image: bretfisher/jekyll-serve
        volumes:
          - .:/site
        ports:
          - '80:4000'

### Example of v3.1 ###

    version: '3.1'  # if no version is specificed then v1 is assumed. Recommend v2 minimum
    
    services:  # containers. same as docker run
      servicename: # a friendly name. this is also DNS name inside network
        image: # Optional if you use build:
        command: # Optional, replace the default CMD specified by the image
        environment: # Optional, same as -e in docker run
        volumes: # Optional, same as -v in docker run
      servicename2:
    
    volumes: # Optional, same as docker volume create
    
    networks: # Optional, same as docker network create

## Useful links ##

* [The YAML format: sample generic YAML file](http://www.yaml.org/start.html)
* [The YAML format: quick reference](http://www.yaml.org/refcard.html)
* [Compose file version differencies](https://docs.docker.com/compose/compose-file/compose-versioning/)
* [Docker Compose release downloads](https://github.com/docker/compose/releases)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
