# Making it easier with Docker Compose: the multi-container tool / Compose for run-time image building and multi-container development #

## Task ##

* Build custom **drupal** image for local testing
* Compose isn't just for developers. Testing apps is easy/fun
* Maybe your learning Drupal admin, or are a software tester
* Start with compose file from previous assignment
* Make your **Dockerfile** and **docker-compose.yml** in dir **compose-assignment-2**
* Use the **drupal** image along with the **postgres** image as before
* Use **README.md** in that dir for details 

## Result ##

### Dockerfile ###

    FROM drupal:8
    
    RUN apt-get update && apt-get install -y git \
        && rm -rf /var/lib/apt/lists/*
    
    WORKDIR /var/www/html/themes
    
    RUN git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupal.org/project/bootstrap.git \
        && chown -R www-data:www-data bootstrap
    
    WORKDIR /var/www/html

### docker-compose.yml ###

    version: '2'
    
    services:
        drupal:
            image: custom-drupal
            build: .
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
                - drupal-data:/var/lib/postgresql/data
    
    volumes:
        drupal-data:
        drupal-modules:
        drupal-profiles:
        drupal-sites:
        drupal-themes:

### Check ###

* Run

        docker-compose up

* Open [http://localhost:8080/](http://localhost:8080/) in browser
* Configure Drupal
* Go to **Appearance**
* The **Bootstrap 3 for Drupal** must be present

### Stop ###

* Press **Ctrl** + **C**
* Run

        docker-compose down

### Run again ###

* Run

        docker-compose up

### Check ###

* Configuration is already done
* DB is already present
* Refresh the page - everything is working

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
