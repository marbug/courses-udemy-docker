#!/bin/sh

docker image ls | awk '{print "docker image rm -f "$3}' | grep -v 'IMAGE ID' | sh

