# Container images / Image tagging and pushing to Docker Hub #

* Create an image (my one from another one):

        docker image tag nginx marabug/nginx

* Publish image:

        docker image push marabug/nginx

* Create a tag:

        docker image tag marabug/nginx marabug/nginx:1.0

* Publish tag:

        docker image push marabug/nginx:1.0

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
