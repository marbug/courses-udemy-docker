#!/bin/sh

docker stack ls | grep -v NAME | awk '{print "docker stack rm "$1}'
