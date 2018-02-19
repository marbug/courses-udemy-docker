# Courses: Udemy "Docker Mastery: The Complete Toolset From a Docker Captain" / Container Registries: Image Storage and Distribution / Run a Private Docker Registry #

## About ##

* Run the registry image on default port 5000
* Re-tag an existing image and push it to your new registry
* Remove that image from local cache and pull it from new registry
* Re-create registry using a bind mount and see how it stores data

## Registry and proper TLS ##

* "Secure by Default": Docker won't talk to registry without HTTPS
* Except localhost (127.0.0.0/8)
* For remote self-signed TLS, enable "insecure-registry" in engine

## Example ##

* Run the registry image:

        docker container run -d -p 5000:5000 --name registry registry
        docker container ls

* Get existing image:

        docker pull hello-world
        docker run hello-world

* Re-tag an existing image and push it to your new registry:

        docker tag hello-world 127.0.0.1:5000/hello-world
        docker image ls
        docker push 127.0.0.1:5000/hello-world

* Remove that image from local cache and pull it from new registry:

        docker image remove hello-world
        docker container rm ...
        docker image remove 127.0.0.1:5000/hello-world
        docker image ls
        docker pull 127.0.0.1:5000/hello-world

* Re-create registry using a bind mount and see how it stores data

        docker container kill registry
        docker container rm registry 
        docker container run -d -p 5000:5000 --name registry -v $(pwd)/registry-data:/var/lib/registry registry
        ls -l registry-data
        docker push 127.0.0.1:5000/hello-world
        ls -l registry-data

## Useful links ##

* **tree**

    * Linux:
    
            apt install tree
            yum install tree

    * Mac:
    
            brew install tree    

    * Windows:
    
        already installed    

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
