# Courses: Udemy "Docker Mastery: The Complete Toolset From a Docker Captain" / Container Registries: Image Storage and Distribution / Use Docker Cloud for Easy Remote Swarm Management #

A new feature for Docker Cloud in 2017 is "Swarms", which in part, allows you to use Cloud as a way to connect your local Docker CLI to a remote Swarm you've created anywhere that has Internet access (no inbound ports needed).

This means you can use your local shell to control a remote swarm cluster with docker commands, without needing SSH access to that server. It also means you can give other people secure access to a swarm via Cloud, without them also needing SSH, and then later revoke their access in Cloud.  

It's not a full RBAC solution like Docker Enterprise Edition provides, but it's better than what we get out of the box with Docker CE!

For now, it works best when using "Docker for Mac" and "Docker for Windows" GUI's, which if you log into them with your Docker ID, you'll see a list of Swarms that you can setup via Docker Cloud.

The way this works is, when you follow the steps in Docker's setup video below, it'll install a "Cloud Agent" container in your Swarm, that allows Cloud to act as a sort of proxy between your local Docker CLI and your remote Swarm. 

## Useful links ##

* [See a quick how-to video on Swarms fleet management feature on YouTube.](https://www.youtube.com/watch?v=VJmbCioYKGg)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
