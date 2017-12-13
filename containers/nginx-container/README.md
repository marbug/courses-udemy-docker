# Containers / Create a Nginx (web server) container #

Run the following in terminal:

    docker container run --publish 80:80 nginx

and see something like

    Unable to find image 'nginx:latest' locally
    latest: Pulling from library/nginx
    e7bb522d92ff: Pull complete
    0f4d7753723e: Pull complete
    91470a14d63f: Pull complete
    Digest: sha256:2ffc60a51c9d658594b63ef5acfac9d92f4e1550f633a3a16d898925c4e7f5a7
    Status: Downloaded newer image for nginx:latest

open [localhost](http://localhost/) in browser and see **Welcome to nginx!** page.

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
