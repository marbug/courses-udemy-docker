# Swarm Basic Features and How to Use Them In Your Workflow / Swarm Stacks and Production Grade Compose #

## Stacks: production grade compose ##

* In 1.13 Docker adds a new layer of abstraction to Swarm called Stacks
* Stacks accept Compose files as their declarative definition for services, networks, and volumes
* We use **docker stack deploy** rather then docker service create
* Stacks manager all those objects for us, including overlay network per stack. Adds stack name to start of their name
* New **deploy:**: key in Compose file. Can't do **build:**
* Compose now ignores **deploy:**, Swarm ignores **build:**
* **docker-compose** cli not needed on Swarm server

TODO

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
