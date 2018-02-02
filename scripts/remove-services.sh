#!/bin/sh

docker service ls | awk '{print "docker service rm "$1}' | grep -v ID | sh
