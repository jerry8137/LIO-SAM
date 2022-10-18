#!/bin/bash

docker run --init -it --rm \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/timezone:/etc/timezone:ro \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/Documents/Jerry/docker_ws:/root/catkin_ws \
    -v /mnt/nfs/Pacifica5/2022-04-14-p5-68/:/data:ro \
    --env="DISPLAY=$DISPLAY" \
    --device=/dev/dri \
    --env="QT_X11_NO_MITSHM=1" \
    --gpus 0 \
    --group-add video \
    --shm-size 60G \
    --name liosam \
    liosam-melodic-bionic \
    bash
