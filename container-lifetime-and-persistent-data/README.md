# Container lifetime and persistent data #

Containers are **usually** immutable and ephemeral.

"immutable infrastructure": only redeploy containers, never change. But what about databases or unique data?

Docker gives us features to ensure these "separation of concerns".

Two ways: Volumes and Bind Mounts.

* Volumes: make special location outside of container UFS
* Bind Mounts: link container path to host path

TODO

## Useful links ##

* [Intro to Immutable Infrastructure Concepts](https://www.oreilly.com/ideas/an-introduction-to-immutable-infrastructure)
* [The 12-Factor App (Everyone Should Read: Key to Cloud Native App Design, Deployment, and Operation)](https://12factor.net/)
* [12 Fractured Apps (A follow-up to 12-Factor, a great article on how to do 12F correctly in containers)](https://medium.com/@kelseyhightower/12-fractured-apps-1080c73d481c)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
