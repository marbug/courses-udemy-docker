# Container lifetime and persistent data / Persistend data: data volumes #

* Use **VOLUME** in **Dockerfile**

        docker pull mysql

Run:

        docker image inspect mysql

and see

            "Volumes": {
                "/var/lib/mysql": {}
            },

Run container:

        docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql

TODO

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
