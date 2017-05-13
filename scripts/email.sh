#!/bin/sh

docker run -it \
    -v /etc/localtime:/etc/localtime \
    -e GMAIL -e GMAIL_NAME \ # pass env variables to config
    -e GMAIL_PASS -e GMAIL_FROM \
    -v $HOME/.gnupg:/home/user/.gnupg \ # so you can encrypt ;)
    --name mutt \
    jess/mutt
