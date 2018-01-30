# Making it easier with Docker Compose: the multi-container tool / Build a compose file for a multi-container service #

## Task ##

* Build a basic compose file for a Drupal content management system website
* Use the **drupal** image along with the **postgres** image
* Use **ports** to expose Drupal on 8080 so you can [http://localhost:8080/](http://localhost:8080/)
* Be sure to set **POSTGRES_PASSWORD** for postgres
* Walk through Drupal setup via browser
* Tip: Drupal assumes DB is **localhost**, but it's service name
* Extra Credit: Use volumes to store Drupal unique data

## Result ##

### docker-compose.yml ###

    version: '2'

    services:
        drupal:
            image: drupal
            ports:
                - "8080:80"
            volumes:
              - drupal-modules:/var/www/html/modules
              - drupal-profiles:/var/www/html/profiles
              - drupal-sites:/var/www/html/sites
              - drupal-themes:/var/www/html/themes
        postgres:
            image: postgres
            environment:
                - POSTGRES_PASSWORD=mypasswd
    
    volumes:
        drupal-modules:
        drupal-profiles:
        drupal-sites:
        drupal-themes:

### Run ###

    docker-compose up

### Configure Drupal ###

Go to [http://localhost:8080/](http://localhost:8080/)

### Stop ###

**Ctrl** + **C**

### Shutdown ###

And remove volumes:

    docker-compose down -v

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
