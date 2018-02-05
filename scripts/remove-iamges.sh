#!/bin/sh

docker image ls | awk '{print "docker image rm "$3}' | sh

