# Making it easier with Docker Compose: the multi-container tool #

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

### Example ###

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

## Useful links ##

* [The YAML format: sample generic YAML file](http://www.yaml.org/start.html)
* [The YAML format: quick reference](http://www.yaml.org/refcard.html)
* [Compose file version differencies](https://docs.docker.com/compose/compose-file/compose-versioning/)
* [Docker Compose release downloads](https://github.com/docker/compose/releases)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
