#!/usr/bin/env bash

docker pull homeassistant/home-assistant:stable  # if this returns "Image is up to date" then you can stop here

docker stop home-assistant  # stop the running container

docker rm home-assistant  # remove it from Docker's list of containers

if [ -d config ]; then
    CONFIG_PATH="${PWD}"/config
elif [ -d ../config ]; then
    CONFIG_PATH="${PWD}"/../config
else
    exit 1
fi

docker run -d \
    --name="home-assistant" \
    -p 8123:8123 \
    -v "${CONFIG_PATH}":/config \
    -v /etc/localtime:/etc/localtime:ro \
    homeassistant/home-assistant:stable

    # --net=host \
