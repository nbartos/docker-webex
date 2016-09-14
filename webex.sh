#!/bin/bash

set -euo pipefail

docker build --tag=webex .
docker run --rm -ti \
	--env "DISPLAY=unix$DISPLAY" \
	--privileged \
	--name=webex \
	--volume /dev/snd:/dev/snd \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	webex
