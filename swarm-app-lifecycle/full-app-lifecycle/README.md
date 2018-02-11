# Swarm App Lifecycle / Full App Lifecycle: Dev, Build and Deploy With a Single Compose Design #

* Single set of Compose files for

    * Local **docker-compose up** development environment
    * Remote **docker-compose up** CI environment
    * Remote **docker stack deploy** production environment

## Files ##

* **docker-compose.override.yml**
* **docker-compose.prod.yml**
* **docker-compose.test.yml**
* **docker-compose.yml**
* **Dockerfile**
* **psql-fake-password.txt**

## docker-compose.yml ##

    version: '3.1'
    
    services:
    
      drupal:
        image: bretfisher/custom-drupal:latest
    
      postgres:
        image: postgres:9.6

## docker-compose.override.yml ##

For local development

    version: '3.1'
    
    services:
    
      drupal:
        build: .
        ports:
          - "8080:80"
        volumes:
          - drupal-modules:/var/www/html/modules
          - drupal-profiles:/var/www/html/profiles
          - drupal-sites:/var/www/html/sites
          - ./themes:/var/www/html/themes
     
      postgres:
        environment:
          - POSTGRES_PASSWORD_FILE=/run/secrets/psql-pw
        secrets:
          - psql-pw
        volumes:
          - drupal-data:/var/lib/postgresql/data
    
    volumes:
      drupal-data:
      drupal-modules:
      drupal-profiles:
      drupal-sites:
      drupal-themes:
    
    secrets:
      psql-pw:
        file: psql-fake-password.txt

## docker-compose.prod.yml ##

    version: '3.1'
    
    services:
    
      drupal:
        ports:
          - "80:80"
        volumes:
          - drupal-modules:/var/www/html/modules
          - drupal-profiles:/var/www/html/profiles
          - drupal-sites:/var/www/html/sites
          - drupal-themes:/var/www/html/themes
     
      postgres:
        environment:
          - POSTGRES_PASSWORD_FILE=/run/secrets/psql-pw
        secrets:
          - psql-pw
        volumes:
          - drupal-data:/var/lib/postgresql/data
    
    volumes:
      drupal-data:
      drupal-modules:
      drupal-profiles:
      drupal-sites:
      drupal-themes:
    
    secrets:
      psql-pw:
        external: true

## docker-compose.test.yml ##

    version: '3.1'
    
    services:
    
      drupal:
        image: bretfisher/custom-drupal
        build: .
        ports:
          - "80:80"
    
      postgres:
        environment:
          - POSTGRES_PASSWORD_FILE=/run/secrets/psql-pw
        secrets:
          - psql-pw
        volumes:
          - ./sample-data:/var/lib/postgresql/data
    secrets:
      psql-pw:
        file: psql-fake-password.txt

## Local development environment ##

Just run

     docker-compose up -d

It will automatically add/replace values from **docker-compose.yml** by values from **docker-compose.override.yml**

Run

    docker inspect fullapplifecycle_drupal_1

and check mounts (they are from override file).

## TODO ##

TODO

## Useful links ##

* [Using Multiple Compose Files (Docker Docs)](https://docs.docker.com/compose/extends/#multiple-compose-files)
* [Using Compose Files In Production (Docker Docs)](https://docs.docker.com/compose/production/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
