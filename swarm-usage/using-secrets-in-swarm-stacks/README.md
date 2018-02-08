# Swarm Basic Features and How to Use Them In Your Workflow / Using Secrets with Swarm Stacks #

## docker-compose.yml ##

    version: "3.1"
    
    services:
      psql:
        image: postgres
        secrets:
          - psql_user
          - psql_password
        environment:
          POSTGRES_PASSWORD_FILE: /run/secrets/psql_password
          POSTGRES_USER_FILE: /run/secrets/psql_user
    
    secrets:
      psql_user:
        file: ./psql_user.txt
      psql_password:
        file: ./psql_password.txt

## psql_user.txt ##

    dbuser

## psql_password.txt ##

    QpqQcgD7dxVG

## Run ##

    docker stack deploy -c docker-compose.yml mydb
    
Check

    docker secret ls    

See

    ID                          NAME                 DRIVER              CREATED             UPDATED
    nwcgkx6sukyn7fvawg1z7yj88   mydb_psql_password                       47 seconds ago      47 seconds ago
    xm6h097tmpxbrmvfodifdwws4   mydb_psql_user                           47 seconds ago      47 seconds ago

## Remove ##

    docker stack rm mydb

## Useful links ##

* [Secrets In Compose Files (Docker Docs)](https://docs.docker.com/compose/compose-file/#secrets-configuration-reference)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
