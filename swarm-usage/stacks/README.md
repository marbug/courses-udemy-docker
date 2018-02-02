# Swarm Basic Features and How to Use Them In Your Workflow / Swarm Stacks and Production Grade Compose #

## Stacks: production grade compose ##

* In 1.13 Docker adds a new layer of abstraction to Swarm called Stacks
* Stacks accept Compose files as their declarative definition for services, networks, and volumes
* We use **docker stack deploy** rather then docker service create
* Stacks manager all those objects for us, including overlay network per stack. Adds stack name to start of their name
* New **deploy:**: key in Compose file. Can't do **build:**
* Compose now ignores **deploy:**, Swarm ignores **build:**
* **docker-compose** cli not needed on Swarm server

## Example ##

### example-voting-app-stack.yml ###

    version: "3"
    
    services:
    
      redis:
        image: redis:alpine
        ports:
          - "6379"
        networks:
          - frontend
        deploy:
          replicas: 2
          update_config:
            parallelism: 2
            delay: 10s
          restart_policy:
            condition: on-failure
    
      db:
        image: postgres:9.4
        volumes:
          - db-data:/var/lib/postgresql/data
        networks:
          - backend
        deploy:
          placement:
            constraints: [node.role == manager ]
    
      vote:
        image: dockersamples/examplevotingapp_vote:before
        ports:
          - 5000:80
        networks:
          - frontend
        depends_on:
          - redis
        deploy:
          replicas: 2
          update_config:
            parallelism: 2
          restart_policy:
            condition: on-failure
    
      result:
        image: dockersamples/examplevotingapp_result:before
        ports:
          - 5001:80
        networks:
          - backend
        depends_on:
          - db
        deploy:
          replicas: 1
          update_config:
            parallelism: 2
            delay: 10s
          restart_policy:
            condition: on-failure
    
      worker:
        image: dockersamples/examplevotingapp_worker
        networks:
          - frontend
          - backend
        deploy:
          mode: replicated
          replicas: 1
          labels: [APP=VOTING]
          restart_policy:
            condition: on-failure
            delay: 10s
            max_attempts: 3
            window: 120s
          placement:
            constraints: [node.role == manager]

### Run ###

    docker stack deploy -c example-voting-app-stack.yml voteapp 

TODO

## Useful links ##

* [Features Not Supported In Stack Deploy](https://docs.docker.com/compose/compose-file/#not-supported-for-docker-stack-deploy)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
