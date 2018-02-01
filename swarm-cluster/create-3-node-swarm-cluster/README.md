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

Type **exit** or press **Ctrl** + **D** to exit.

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

## Useful info ##

* [Digital Ocean Coupon for $10](...)
* [Create and Upload a SSH Key to Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets)
* [Docker Swarm Firewall Ports](https://www.bretfisher.com/docker-swarm-firewall-ports/)
* [Configure SSH for Saving Options for Specific Connections](https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
