# Container lifetime and persistent data / Persistend data: bind mounting #

* Maps a host file or directory to a container file or directory
* Basically just two locations pointing to the same file(s)
* Again, skips UFS, and host files overwrite any in container
* Can't use in Dockerfile, must be at **container run**

    * Mac/Linux

            ... run -v /Users/marabug/cpp/marbug/courses-udemy-docker/container-images/extend-official-images:/path/container

    * Windows

            ... run -v //c/Users/marabug/cpp/marbug/courses-udemy-docker/container-images/extend-official-images:/path/container

## Example ##

    cd /Users/marabug/cpp/marbug/courses-udemy-docker/container-images/extend-official-images
    docker container run -d --name nginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
