# Swarm Basic Features and How to Use Them In Your Workflow / Scaling Out with Routing Mesh #

* Routes ingress (incoming) packets for a Service to proper Task
* Spans all nodes in Swarm
* Uses IPVS from Linux Kernel
* Load balances Swarm Services across their Tasks
* Two ways this works

    * Container-to-container in a Overlay network (uses VIP)
    * External traffic incoming to published ports (all nodes listen)

## Example ##

    docker service create --name search --replicas 3 -p 9200:9200 elasticsearch:2
    docker service ps search
    curl localhost:9200    

## About ##

* This is stateless load balancing
* This LB is at OSI Layer 3 (TCP), not Layer 4 (DNS)
    
## Useful links ##

* [Use swarm mode routing mesh (Docker Docs)](https://docs.docker.com/engine/swarm/ingress/)    

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
