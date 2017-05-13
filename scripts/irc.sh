#!/bin/sh

 # mounts irssi config in container
 # cool new feature in 1.5
exec sudo docker run -it \
    -v /etc/localtime:/etc/localtime  \
    -v $HOME/.irssi:/home/user/.irssi \
    --read-only  \
    --name irssi \
    jess/irssi
