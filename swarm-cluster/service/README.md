# Swarm intro and creating a 3-node swarm cluster / Create Your First Service and Scale It Locally #

## Check ##

    docker info | grep Swarm

## Init ##

If swarm is inactive then run

    docker swarm init
    
## What just happened ##

* Lots of PKI and security automation

    * Root Signing Certificate created for out Swarm
    * Certificate is issues for first Manager node
    * Join tokens are created
    
* Raft database created to store root CA, configs and secrets

    * Encrypted by default on disk (1.13+)
    * No need for another key/value system to hold orchestration/secrets
    * Replicates logs amongst Managers via mutual TLS in "control plane"         

## Nodes ##

    docker node ls
    
    docker node --help

## Swarm ##
    
    docker swarm --help

## Service ##

### Help ##

    docker service --help

### Create service ###
    
    docker service create alpine ping 8.8.8.8

### View services ###
    
    docker service ls

The result

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    jrw2cik3xr56        optimistic_kalam    replicated          1/1                 alpine:latest       

### Service info ###

    docker service ps optimistic_kalam

The result

    ID                  NAME                 IMAGE               NODE                    DESIRED STATE       CURRENT STATE                ERROR               PORTS
    wwf6bd9uj2zy        optimistic_kalam.1   alpine:latest       linuxkit-025000000001   Running             Running about a minute ago                       
    
### View containers ###

    docker container ls     

The result:

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    01886518ed3a        alpine:latest       "ping 8.8.8.8"      2 minutes ago       Up 2 minutes                            optimistic_kalam.1.wwf6bd9uj2zy17mn99cb2pw12

### Change number of replicas ###

    docker service update jrw2cik3xr56 --replicas 3 

### Check services ###
    
    docker service ls

The result

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    jrw2cik3xr56        optimistic_kalam    replicated          3/3                 alpine:latest       

### Service info ###

    docker service ps optimistic_kalam
    
The result

    ID                  NAME                 IMAGE               NODE                    DESIRED STATE       CURRENT STATE            ERROR               PORTS
    wwf6bd9uj2zy        optimistic_kalam.1   alpine:latest       linuxkit-025000000001   Running             Running 6 minutes ago                        
    v8hum8dbmtie        optimistic_kalam.2   alpine:latest       linuxkit-025000000001   Running             Running 56 seconds ago                       
    i57km8vct5i9        optimistic_kalam.3   alpine:latest       linuxkit-025000000001   Running             Running 56 seconds ago           

## Manage ##

    docker update --help
    
    docker service update --help

## View containers ##

    docker container ls

The result

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    add5e0bf95ef        alpine:latest       "ping 8.8.8.8"      16 minutes ago      Up 16 minutes                           optimistic_kalam.2.v8hum8dbmtievvkkins161quy
    16a82fd05f42        alpine:latest       "ping 8.8.8.8"      16 minutes ago      Up 16 minutes                           optimistic_kalam.3.i57km8vct5i9jquhrut8lm7s6
    01886518ed3a        alpine:latest       "ping 8.8.8.8"      21 minutes ago      Up 22 minutes                           optimistic_kalam.1.wwf6bd9uj2zy17mn99cb2pw12

## Remove container ##

    docker container rm -f optimistic_kalam.1.wwf6bd9uj2zy17mn99cb2pw12 

## Service info ##

Run

    docker service ls

The result

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    jrw2cik3xr56        optimistic_kalam    replicated          2/3                 alpine:latest       

Then again

    docker service ls

The result

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    jrw2cik3xr56        optimistic_kalam    replicated          3/3                 alpine:latest       

i.e. container was run automatically.

Check

    docker service ps optimistic_kalam

The result

    ID                  NAME                     IMAGE               NODE                    DESIRED STATE       CURRENT STATE            ERROR                         PORTS
    nuhq6n0f6e57        optimistic_kalam.1       alpine:latest       linuxkit-025000000001   Running             Running 2 minutes ago                                  
    wwf6bd9uj2zy         \_ optimistic_kalam.1   alpine:latest       linuxkit-025000000001   Shutdown            Failed 2 minutes ago     "task: non-zero exit (137)"   
    v8hum8dbmtie        optimistic_kalam.2       alpine:latest       linuxkit-025000000001   Running             Running 20 minutes ago                                 
    i57km8vct5i9        optimistic_kalam.3       alpine:latest       linuxkit-025000000001   Running             Running 20 minutes ago       

## Remove service ##

    docker service rm optimistic_kalam 

## Check ##

    docker service ls

is blank.

    docker container ls
    
is blank.

## Useful links ##

* [Deploy services to a swarm (Docker Docs)](https://docs.docker.com/engine/swarm/services/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
