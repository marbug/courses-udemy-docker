# Swarm intro and creating a 3-node swarm cluster / Swarm mode: built-in orchestration #

## Introduction ##

Containers everywhere = new problems

* How do we automate container lifecycle
* How can we easily scale out/in/up/down
* How can we ensure our containers are re-created if they fail
* How can we replace containers without downtime (blue/green deploy)
* How can we control/track where containers get started
* How can we create cross-node virtual networks
* How can we ensure only trusted servers run our containers
* How can we store secrets, keys, passwords and get them to the right container (and only that container)

## About ##

Swarm mode: built-in orchestration

* Swarm mode is a clustering solution built inside Docker
* Not related to Swarm "classic" for pre-1.12 versions
* Added in 1.12 (summer 2016) via SwarmKit toolkit
* Enhanced in 1.13 (January 2017) via Stacks and Secrets 
* Not enabled by default, new commands once enabled

    * docker swarm
    * docker node
    * docker service
    * docker stack
    * docker secret
    
## Useful links ##

* [Docker 1.12 Swarm mode deep drive part 1: Topology (YouTube)](https://www.youtube.com/watch?v=dooPhkXT9yI)
* [Docker 1.12 Swarm mode deep drive part 1: Orchestration (YouTube)](https://www.youtube.com/watch?v=_F6PSP-qhdA)
* [Heart of the SwarmKit: Topology management (slides)](https://speakerdeck.com/aluzzardi/heart-of-the-swarmkit-topology-management)
* [Heart of the SwarmKit: Store, Topology and Object Model (YouTube)](https://www.youtube.com/watch?v=EmePhjGnCXY)
* [Raft Consensus Visualization (Our Swarm DB and how it stays in sync across nodes)](http://thesecretlivesofdata.com/raft/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
