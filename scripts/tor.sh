#!/bin/sh

docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
    -e DISPLAY=unix$DISPLAY \ # pass the display
    --device /dev/snd \ # sound
    --name tor-browser \
    jess/tor-browser
