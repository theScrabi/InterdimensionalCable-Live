#!/bin/bash

source config.sh

docker run \
    --name=interdimensional_cable \
    --rm=true \
    -p 5901:5901 \
    -d \
    interdimensional_cable
