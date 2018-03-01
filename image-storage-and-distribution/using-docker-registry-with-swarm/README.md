# Courses: Udemy "Docker Mastery: The Complete Toolset From a Docker Captain" / Container Registries: Image Storage and Distribution / Using Docker Registry With Swarm #

## Task ##

The default registry install is rather bare bones, and is open by default, meaning anyone can push and pull images.  You'll likely want to at least add TLS to it so you can work with it easily via HTTPS, and then also add some basic authentication.  

These aren't actually that hard to setup, but do require some commands.  You can learn the basics by creating a self-signed certificate for HTTPS, and then enabling **htpasswd** auth, which you'll add users too with basic cli commands.

For this assignment you'll use Play With Docker, a great resource for web-based docker testing and also has a library of labs built by Docker Captains and others, and supported by Docker Inc. 

I'd like you to do the [Part 2 and 3 of "Docker Registry for Linux"](http://training.play-with-docker.com/linux-registry-part2/) for this assignment. You can use their text to do this assignment on your own machine, or jump back to their [Part 1](http://training.play-with-docker.com/linux-registry-part1/) and run the container on their infrastructure  using their web-based interface to a real docker engine and learn how "PWD" works!

For more extra credit labs, look through their growing list: [http://training.play-with-docker.com/](http://training.play-with-docker.com/)

## Notes ##

* Works the same way as localhost
* Because of Routing Mesh, all nodes can see 127.0.0.1:5000
* Remember to decide how to store images (volume driver)

## Result ##

* Go to [labs.play-with-docker.com](labs.play-with-docker.com)
* Click **Start**
* Click utility icon on the between **Instances** and **Settings**
* Select **5 managers and no workers**
* Run

        docker node ls
        docker service create --name registry --publish 5000:5000 registry
        docker service ps registry

* On the top click on **5000** port
* You'll be redirected to something like [http://ip172-18-0-59-bac38ahlukr0009t9evg-5000.direct.labs.play-with-docker.com/](http://ip172-18-0-59-bac38ahlukr0009t9evg-5000.direct.labs.play-with-docker.com/) with blank page
* Go to same address but with **/v2/_catalog** path and see something like

        {"repositories":[]}

* Return back to labs.play-with-docker.com tab and run

        docker pull hello-world
        docker tag hello-world 127.0.0.1:5000/hello-world
        docker push 127.0.0.1:5000/hello-world
        
* Refresh tab with **/v2/_catalog** path and see

        {"repositories":["hello-world"]}         

* Return back to labs.play-with-docker.com tab and run

        docker pull nginx
        docker tag nginx 127.0.0.1:5000/nginx
        docker push 127.0.0.1:5000/nginx

* Refresh tab with **/v2/_catalog** path and see

        {"repositories":["hello-world","nginx"]}         

* Return back to labs.play-with-docker.com tab and run

        docker service create --name nginx -p 80:80 --replicas 5 --detach=false 127.0.0.1:5000/nginx

* Port **80** will appear on top. Click on it.
* You'll be redirected to something like [http://ip172-18-0-59-bac38ahlukr0009t9evg-80.direct.labs.play-with-docker.com/](http://ip172-18-0-59-bac38ahlukr0009t9evg-80.direct.labs.play-with-docker.com/) with

        Welcome to nginx!
        If you see this page, the nginx web server is successfully installed and working. Further configuration is required.
        
        For online documentation and support please refer to nginx.org.
        Commercial support is available at nginx.com.
        
        Thank you for using nginx.

## Note ##

* All nodes must be able to access images

## ProTip ##

* Use a hosted SaaS registry if possible

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
