# Making it easier with Docker Compose: the multi-container tool / Add image building #

* Compose can also build your custom images
* Will build them with **docker-compose up** if not found in cache
* Also rebuild with **docker-compose build**
* Great for complex builds that have lots of vars or build args

## docker-compose.yml ##

    version: '2'

    # based off compose-sample-2, only we build nginx.conf into image
    # uses sample site from https://startbootstrap.com/template-overviews/agency/

    services:
      proxy:
        build:
          context: .
          dockerfile: nginx.Dockerfile
        ports:
          - '80:80'
      web:
        image: httpd
        volumes:
          - ./html:/usr/local/apache2/htdocs/

## nginx.conf ##
    
    server {
    
            listen 80;
    
            location / {
    
                    proxy_pass         http://web;
                    proxy_redirect     off;
                    proxy_set_header   Host $host;
                    proxy_set_header   X-Real-IP $remote_addr;
                    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
                    proxy_set_header   X-Forwarded-Host $server_name;
    
            }
    }

## nginx.Dockerfile ##

    FROM nginx:1.13
    
    COPY nginx.conf /etc/nginx/conf.d/default.conf

## Useful links ##

* [Compose file build options](https://docs.docker.com/compose/compose-file/#build)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
