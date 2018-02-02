# Swarm Basic Features and How to Use Them In Your Workflow / Secrets Storage for Swarm: Protecting Your Environment Variables #

* Easiest "secure" solution for storing secrets in Swarm
* What is s Secret

    * Usernames and passwords
    * TLS certificates and keys
    * SSH keys
    * Any data you would prefer no be "on front page of news"
    
* Supports generic strings or binary content up to 500Kb in size
* Doesn't require apps to be rewritten

## How it works ##

* As of Docker 1.13.0 Swarm Raft DB is encrypted on disk
* Only stored on disk on Manager nodes
* Default is Managers and Workers "control plane" is TLS + Mutual Auth
* Secrets are first stored in Swarm, then assigned to a Service(s)
* Only containers in assigned Service(s) can see them
* They look like files in containers but are actually in-memory fs

    * **/run/secrets/<secret_name>**
    * or **/run/secrets/<secret_alias>**
    
* Local docker-compose can use file-based secrets, but not secure 

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
