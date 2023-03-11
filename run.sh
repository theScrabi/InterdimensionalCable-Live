#!/bin/bash

source config.sh

docker run \
	--name=interdimensional_cable \
	--rm=true \
	-p 127.0.0.1:5901:5901 \
	-v $PWD/videos:/home/videos \
	-d \
	interdimensional_cable
