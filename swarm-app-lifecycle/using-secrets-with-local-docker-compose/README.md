# Swarm App Lifecycle / Using Secrets With Local Docker Compose #

## docker-compose.yml ##

Let's use **docker-compose.yml** from [Using Secrets with Swarm Stacks](../../swarm-usage/using-secrets-in-swarm-stacks/README.md) 

I.e.

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

## psql_user.txt and psql_password.txt ##

Let's use **psql_user.txt** and **psql_password.txt** from [Using Secrets with Swarm Stacks](../../swarm-usage/using-secrets-in-swarm-stacks/README.md) 

## Run ##

    docker-compose up -d
    
## Check psql_user ##

    docker-compose exec psql cat /run/secrets/psql_user

## Check psql_password ##

    docker-compose exec psql cat /run/secrets/psql_password

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
