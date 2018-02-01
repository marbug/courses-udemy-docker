# Swarm intro and creating a 3-node swarm cluster / UI change for service create/update #

History of changes to CLI output for service create/update:

* Before 17.05, the service commands would immediately return to your shell prompt and the containers would be scheduled in the background (asynchronously). To check if they deployed properly you would need to use docker service ls and docker service ps.

* Starting in 17.05 the service commands were given a **--detach**  option, which defaulted to **true** , but warned you each time about a future change to **false** . The create/update commands were still asynchronous.

* Starting in 17.10 the **--detach**  default changes to **false** , so you'll always see the UI wait synchronously while service tasks are deployed/updated, unless you set **--detach** **true**  in each command.

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
