# Container images / Building images: extending official images #

## Dockerfile ##

    # this same shows how we can extend/change an existing official image from Docker Hub

    FROM nginx:latest
    # highly recommend you always pin versions for anything beyond dev/learn

    WORKDIR /usr/share/nginx/html
    # change working directory to root of nginx webhost
    # using WORKDIR is prefered to using 'RUN cd /some/path'

    COPY index.html index.html

    # I don't have to specify EXPOSE or CMD because there in my FROM

## index.html ##

    <!doctype html>
    <html lang="en">
    <head>
      <meta charset="utf-8">

      <title>Your 2nd Dockerfile worked!</title>

    </head>

    <body>
      <h1>You just successfully ran a container with a custom file copied into the image at build time!</h1>
    </body>
    </html>

## Check default image ##

* Run:

        docker container run -p 80:80 --rm nginx

* Open [localhost](http://localhost/) and remember how the page looks like

* Stop the image by pressing **Ctrl** + **C**

## Create custom image ##

    docker image build -t nginx-with-html .

## Check custom image ##

* Run:

        docker container run -p 80:80 --rm nginx-with-html

* Open [localhost](http://localhost/) and check how the page looks now

* Stop the image by pressing **Ctrl** + **C**

## Create tag ##

    docker image tag nginx-with-html:latest marabug/nginx-with-html:latest

## Useful info ##

* Use **WORKDIR**

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
