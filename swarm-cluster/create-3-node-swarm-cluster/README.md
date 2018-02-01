# Swarm intro and creating a 3-node swarm cluster / Creating a 3-Node Swarm Cluster #

## Host options ##

* [play-with-docker.com](https://play-with-docker.com/)

    * Only needs a browser, but reset after 4 hours
    
* docker-machine + VirtualBox

    * Free and runs locally, but requires a machine with 8GB memory
    
* Digital Ocean + Docker install

    * Most line a production setup, but costs $5-10/node/month while learning
    * Use my referral code in section resources to get $10 free
    
* Roll your own

    * docker-machine can provision machines for Amazon, Azure, DO, Google, etc
    * install docker anywhere with get.docker.com
    
## docker-machine ##

    docker-machine --help
    
### Create machine ###

    docker-machine create node1

### SSH to machine ###
    
    docker-machine ssh node1

Type **exit** to exit.

### Check machive env ###

Run

    docker-machine env node1

The result

    export DOCKER_TLS_VERIFY="1"
    export DOCKER_HOST="tcp://192.168.99.100:2376"
    export DOCKER_CERT_PATH="/Users/marbug/.docker/machine/machines/node1"
    export DOCKER_MACHINE_NAME="node1"
    # Run this command to configure your shell: 
    # eval $(docker-machine env node1)
    
P.S. VirtualBox must have configured network and DHCP enhabled        

### Create two more nodes ###

    docker-machine create node2
    docker-machine create node3

### Configure node1 ###

    docker-machine ssh node1
    docker swarm init

and see

    Error response from daemon: could not choose an IP address to advertise since this system has multiple addresses on different interfaces (10.0.2.15 on eth0 and 192.168.99.100 on eth1) - specify one with --advertise-addr

Then

    docker swarm init --advertise-addr 192.168.99.100

and see

    warm initialized: current node (3iwin6oxf6yjp2lh8roka968v) is now a manager.
    
    To add a worker to this swarm, run the following command:
    
        docker swarm join --token SWMTKN-1-12tt2kuawk98gfyx6afvpunmp31v0lrq2jkqvs8iuc9zwniysa-a84xn8v0blkw6ltuyzkzzum9q 192.168.99.100:2377
    
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

Exit from machine

### Configure node2 ###

    docker-machine ssh node2
    docker swarm join --token SWMTKN-1-12tt2kuawk98gfyx6afvpunmp31v0lrq2jkqvs8iuc9zwniysa-a84xn8v0blkw6ltuyzkzzum9q 192.168.99.100:2377
    
exit and check on node1    

    docker-machine ssh node1
    docker node ls

and see

    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    3iwin6oxf6yjp2lh8roka968v *   node1               Ready               Active              Leader
    764e3un3shb8t66tso3094z1m     node2               Ready               Active              

Add node2 as manager

    docker node update --role manager node2

Check

    docker node ls
    
and see
    
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    3iwin6oxf6yjp2lh8roka968v *   node1               Ready               Active              Leader
    764e3un3shb8t66tso3094z1m     node2               Ready               Active              Reachable

### Configure node3 ###

On node1

    docker swarm join-token manager

and see

    To add a manager to this swarm, run the following command:
    
        docker swarm join --token SWMTKN-1-12tt2kuawk98gfyx6afvpunmp31v0lrq2jkqvs8iuc9zwniysa-6dnehmjijulmoaeguypjm1yz2 192.168.99.100:2377

On node3

    docker swarm join --token SWMTKN-1-12tt2kuawk98gfyx6afvpunmp31v0lrq2jkqvs8iuc9zwniysa-6dnehmjijulmoaeguypjm1yz2 192.168.99.100:2377

and see

    This node joined a swarm as a manager.
    
Check on node1

    docker node ls
    
and see

    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    3iwin6oxf6yjp2lh8roka968v *   node1               Ready               Active              Leader
    764e3un3shb8t66tso3094z1m     node2               Ready               Active              Reachable
    qau45nfccpsbj8mvfucqs6xop     node3               Ready               Active              Reachable        

### Run services on node1 ###

    docker-machine ssh node1
    docker service create --replicas 3 alpine ping 8.8.8.8
    docker service ls 

and see

    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    kwqcz25jjgi7        heuristic_morse     replicated          3/3                 alpine:latest       

Check nodes from node1

    docker node ps
    docker node ps node2

## Useful info ##

* [Digital Ocean Coupon for $10](...)
* [Create and Upload a SSH Key to Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets)
* [Docker Swarm Firewall Ports](https://www.bretfisher.com/docker-swarm-firewall-ports/)
* [Configure SSH for Saving Options for Specific Connections](https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
