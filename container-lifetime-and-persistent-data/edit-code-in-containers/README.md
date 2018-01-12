# Container lifetime and persistent data / Edit code running in containers with bind mounts #

* Use a Jekyll **Static Site Generator** to start a local web server
* Don't have to be web developer: this is example of bridging the gap between local file access and apps running in containers
* Source code is in the course repo under **bindmount-sample-1**
* We edit files with editor on our host using native tools
* Container detects changes with host files and updates web server
* Start container with

    docker run -p 80:4000 -v $(pwd):/site bretfisher/jekyll-serve

* Refresh your browser to see changes
* Change the file in **_posts** and refresh browser to see changes

TODO (recheck this code from scretch and try to implement the same via own container)

## Useful info ##

* [Jekyll, a Static Site Generator (just as background info, no need to install)](https://jekyllrb.com/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
