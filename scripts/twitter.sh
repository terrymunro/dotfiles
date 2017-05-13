#!/bin/sh

docker run -it \
    -v /etc/localtime:/etc/localtime \
    -v $HOME/.rainbow_oauth:/root/.rainbow_oauth \ # mount config files
    -v $HOME/.rainbow_config.json:/root/.rainbow_config.json \
    --name rainbowstream \
    jess/rainbowstream
