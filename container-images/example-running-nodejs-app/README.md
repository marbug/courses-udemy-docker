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

Open [localhost](localhost)

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
