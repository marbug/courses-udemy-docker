# Container images / Example: Dockerfile for nodejs #

## Dockerfile ##

    FROM node:6-alpine
    RUN mkdir -p /usr/src/app
    WORKDIR /usr/src/app
    COPY marbug-app/package.json package.json
    RUN npm install && npm cache clean
    COPY marbug-app .
    EXPOSE 3000
    CMD [ "node", "./app.js" ]

## Test build ##

    docker build -t testnode .

## Test run ##

    docker container run --rm -p 80:3000 testnode

## Check ##

Open [localhost](http://localhost/)

## View images ##

    docker images

or

    docker image ls

## Create tag ##

    docker tag testnode:latest marabug/testing-nodejs

## Push to Docker Hub ##

    docker push marabug/testing-nodejs

## View images ##

    docker images

or

    docker image ls

## Remove local image ##

    docker image rm marabug/testing-nodejs

## Run image from Docker Hub ##

    docker container run --rm -p 80:3000 marabug/testing-nodejs

## Check ##

Open [localhost](http://localhost/)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
