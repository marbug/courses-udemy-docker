# Swarm Basic Features and How to Use Them In Your Workflow / Scaling Out with Overlay Networking #

* Just choose **--driver overlay** when creating network
* For container-to-container traffic inside a single Swarm
* Optional IPSec (AES) encryption on network creation
* Each service can be connected to multiple networks

    * (e.g. front-end, back-end)

## Create network ##

Create

    docker network create --driver overlay mydrupal

Check

    docker network ls
    
See

    NETWORK ID          NAME                DRIVER              SCOPE
    jgov8kygsieh        mydrupal            overlay             swarm

## Create postgres service ##

Run

    docker service create --name psql --network mydrupal -e POSTGRES_PASSWORD=mypass postgres    

Check

    docker service ls
    
See

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    23b4338ltnnp        psql                replicated          1/1                 postgres:latest     

### Check running ###

Run

    docker service ps psql

See

    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE            ERROR               PORTS
    omt3sikrtht6        psql.1              postgres:latest     linuxkit-025000000001   Running             Running 37 seconds ago                       

### Check container logs ###

Run

    docker container ls

See    
    
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    f86741949f0b        postgres:latest     "docker-entrypoint.s…"   2 minutes ago       Up 3 minutes        5432/tcp            psql.1.omt3sikrtht66tjeugu1k7ovn
    
Run

    docker container logs psql.1.omt3sikrtht66tjeugu1k7ovn    

See logs.

## Create drupal service ##

Run

    docker service create --name drupal --network mydrupal -p 80:80 drupal

Check

    docker service ls
    
See
    
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    q2x94nx8646r        dripal              replicated          1/1                 drupal:latest       *:80->80/tcp
    23b4338ltnnp        psql                replicated          1/1                 postgres:latest     

### Check running ###

Run

    docker service ps drupal

See

    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE                    ERROR               PORTS
    qfxh9exebi5g        drupal.1            drupal:latest       linuxkit-025000000001   Running             Running less than a second ago       

## Configure drupal ##

Open [http://localhost](http://localhost).

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
