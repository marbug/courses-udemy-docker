#!/bin/sh

docker container ls | awk '{print "docker container rm -f "$1}' | grep -v CONTAINER | sh

