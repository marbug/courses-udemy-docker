# Swarm App Lifecycle / Service Updates: Changing Things In Flight #

* Provides rolling replacement of tasks/containers in a service
* Limits downtime (be careful with "prevents" downtime)
* Will replace containers for most changes
* Has many, many cli options to control the update
* Create options will usually change, adding -add or -rm to them
* Includes rollback and healthcheck options
* Also has scale & rollback subcommands for quicker access

    * **docker service scale web=4** and **docker service rollback web**

* A stack deploy, when pre-existing, will issue service updates

## Examples ##

* Just update the image used to a newer version

        docker service update --image myapp:1.2.1 <servicename>
        
* Adding an environment variable and remove a port

        docker service update --env-add NODE_ENV=production --publish-rm 8080

* Change number of replicas of two services

        docker service scale web=8 api=6

## Swarm updates in Stack files ##

Same command. Just edit the YAML file, then

    docker stack deploy -c file.yml <stackname>

## Result ##

### Create service ###

Run

    docker service create -p 8088:80 --name web nginx:1.13.7

Check

    docker service ls

See

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    nwrrjwquhy89        web                 replicated          1/1                 nginx:1.13.7        *:8088->80/tcp

### Scale ###

    docker service scale web=5

### Change image ##

    docker service update --image nginx:1.13.6 web

### Change port ###

    docker service update --publish-rm 8088 --publish-add 9090:80 web

### Force update ###

    docker service update --force web

## Cleanup ##

### Remove the service we created ##

    docker service rm web

## Useful links ##

* [Service Update command (Docker Docs)](https://docs.docker.com/engine/reference/commandline/service_update/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
