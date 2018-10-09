#!/bin/bash

xhost +
docker exec -it docker_dev sh -c 'DISPLAY=${DISPLAY} ${1}'
xhost -