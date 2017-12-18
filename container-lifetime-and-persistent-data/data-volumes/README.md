# Container lifetime and persistent data / Persistend data: data volumes #

## Use **VOLUME** in **Dockerfile** ##

For example:

    docker pull mysql

Run:

    docker image inspect mysql

and see:

    "Volumes": {
        "/var/lib/mysql": {}
    },

Run container:

    docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql

Ensure that it's running:

    docker container ls

Run:

    docker container inspect mysql

and see something like:

        "Mounts": [
            {
                "Type": "volume",
                "Name": "ee19131c316ba9c014e40f9ee6cecedb12e9d3e7a6345ce807092f50bc929182",
                "Source": "/var/lib/docker/volumes/ee19131c316ba9c014e40f9ee6cecedb12e9d3e7a6345ce807092f50bc929182/_data",
                "Destination": "/var/lib/mysql",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],

Check volumes:

    docker volume ls

Check particular volume:

    docker volume inspect ee19131c316ba9c014e40f9ee6cecedb12e9d3e7a6345ce807092f50bc929182

and see something like:

    [
        {
            "CreatedAt": "2017-12-18T07:46:51Z",
            "Driver": "local",
            "Labels": null,
            "Mountpoint": "/var/lib/docker/volumes/ee19131c316ba9c014e40f9ee6cecedb12e9d3e7a6345ce807092f50bc929182/_data",
            "Name": "ee19131c316ba9c014e40f9ee6cecedb12e9d3e7a6345ce807092f50bc929182",
            "Options": {},
            "Scope": "local"
        }
    ]

On linux you could go to the **Mountpoint** path and see data. But on Mac and Windows a Linux VM is created - you cannot go to that path.

If we create another container, then it will create another volume. So we have to create named volumes.

    docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v /var/lib/mysql mysql

or

    docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql

See the result by running

    docker volume ls

If you wanna to create volume before running container, then use:

    docker volume create --help

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
