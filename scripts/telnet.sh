#!/bin/sh

docker run -it --rm \
  --log-driver none \
  jess/telnet "$@"
