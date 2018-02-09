# Swarm Basic Features and How to Use Them In Your Workflow / Create A Stack with Secrets and Deploy #

## Task ##

* Let's use our Drupal compose file from last assignment

    * **compose-assignment-2**

* Rename image back to official **drupal:8.2**
* Remove **build:**
* Add secret via **external:**
* Use environment variable **POSTGRES_PASSWORD_FILE**
* Add secret via cli **echo "password" | docker secret create psql-pw -**
* Copy compose into a new yml file on your Swarm node1

## Result ##

### docker-compose.yml ##

    version: '3.1'
    
    services:
        drupal:
            image: drupal:8.2
            ports:
                - "8080:80"
            volumes:
                - drupal-modules:/var/www/html/modules
                - drupal-profiles:/var/www/html/profiles
                - drupal-sites:/var/www/html/sites
                - drupal-themes:/var/www/html/themes
        postgres:
            image: postgres:9.6
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

### Run ###

    echo "oagy938hs" | docker secret create psql-pw - 
    docker stack deploy -c docker-compose.yml drupal

### Check ###    

Run

    docker stack ps drupal

Result

    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE              ERROR               PORTS
    gvdzickxuqu3        drupal_postgres.1   postgres:9.6        linuxkit-025000000001   Running             Preparing 34 seconds ago                       
    qsceezqepaas        drupal_drupal.1     drupal:8.2          linuxkit-025000000001   Running             Preparing 36 seconds ago              

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
