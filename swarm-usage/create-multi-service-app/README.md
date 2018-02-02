# Swarm Basic Features and How to Use Them In Your Workflow / Create A Multi-Service Multi-Node Web App #

## Task ##

* Using Docker's distributed voting app
* Use **swarm-app-1** directory in our course repo for requirements
* 1 volume, 2 networks, and 5 services needed
* Create the commands needed, spin up services, and test app
* Everything is using Docker Hub images, so no data needed on Swarm

## Result ##

    docker network create -d overlay backend
    docker network create -d overlay frontend
    docker service create --name vote -p 80:80 --network frontend --replicas 2 dockersamples/examplevotingapp_vote:before
    docker service create --name redis --network frontend --replicas 1 redis:3.2
    docker service create --name db --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4
    docker service create --name result --network backend -p 5001:80 dockersamples/examplevotingapp_result:before
    docker service create --name worker --network frontend --network backend dockersamples/examplevotingapp_worker 

Check

    docker service ls

Result

    ID                  NAME                MODE                REPLICAS            IMAGE                                          PORTS
    dmkqggygokfl        db                  replicated          1/1                 postgres:9.4                                   
    21u6jr06w10y        redis               replicated          1/1                 redis:3.2                                      
    hcd69xh2jegq        result              replicated          1/1                 dockersamples/examplevotingapp_result:before   *:5001->80/tcp
    st6fcg83yt0h        vote                replicated          2/2                 dockersamples/examplevotingapp_vote:before     *:80->80/tcp
    urdq2ykr674q        worker              replicated          1/1                 dockersamples/examplevotingapp_worker:latest   

Check in browser 
    
* [http://localhost/](http://localhost/)
* [http://localhost:5001/](http://localhost:5001/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
