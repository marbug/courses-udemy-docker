# Container lifetime and persistent data / Persistend data: bind mounting #

* Maps a host file or directory to a container file or directory
* Basically just two locations pointing to the same file(s)
* Again, skips UFS, and host files overwrite any in container
* Can't use in Dockerfile, must be at **container run**

    * Mac/Linux

            ... run -v /Users/marabug/stuff:/path/container

    * Windows

            ... run -v //c/Users/marabug/stuff:/path/container

TODO

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
