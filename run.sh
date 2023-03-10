#!/bin/bash

source config.sh

docker run \
    --name=nichtparajitsi \
    --rm=true \
    -p 127.0.0.1:5901:5901 \
    -d \
    nichtparajitsi
