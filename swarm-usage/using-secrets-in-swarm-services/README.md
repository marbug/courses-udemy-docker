# Swarm Basic Features and How to Use Them In Your Workflow / Using Secrets in Swarm Services #

**On node1 ...**

## psql_user.txt ##

    mypsqluser

## Create secret inside swarm ##

* Give a file
* Pass a value at command line

### Give a file ###

    docker secret create psql_user psql_user.txt

Result

    sjmhcxh2jtwhftax90ri9ttce    

### Pass a value at command line ###

    echo "myDBpassWORD" | docker secret create psql_pass -

Result

    ddedyengg7brw2d8hrkpnr81p

### Check ###

    docker secret ls

Result

    ID                          NAME                DRIVER              CREATED              UPDATED
    ddedyengg7brw2d8hrkpnr81p   psql_pass                               About a minute ago   About a minute ago
    sjmhcxh2jtwhftax90ri9ttce   psql_user                               3 minutes ago        3 minutes ago

### View secret info ###

    docker secret inspect psql_user

Result
    
    [
        {
            "ID": "sjmhcxh2jtwhftax90ri9ttce",
            "Version": {
                "Index": 1513
            },
            "CreatedAt": "2018-02-08T09:51:13.417984657Z",
            "UpdatedAt": "2018-02-08T09:51:13.417984657Z",
            "Spec": {
                "Name": "psql_user",
                "Labels": {}
            }
        }
    ]

## Create service using secrets ##

    docker service create --name psql --secret psql_user --secret psql_pass -e POSTGRES_PASSWORD_FILE=/run/secrets/psql_pass -e POSTGRES_USER_FILE=/run/secrets/psql_user postgres

Result

    l32qtpzrrvgfffj40n0mab3vz

## Check ##

Run

    docker service ps psql
    
Result

    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE            ERROR               PORTS
    6bby8rd8rw4u        psql.1              postgres:latest     linuxkit-025000000001   Running             Running 10 minutes ago          

Run
    
    docker exec -it psql.1.6bby8rd8rw4u bash
    
Run

    ls -1 /run/secrets/     

and see

    psql_pass
    psql_user

Run
 
    cat /run/secrets/psql_user

## Remove secret ##

    docker service update --secret-rm

This will remove secret and redeploy container.

## Useful links ##

* [Manage sensitive data with Docker secrets (Docker Docs) (Lots of good reading and examples)](https://docs.docker.com/engine/swarm/secrets/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
