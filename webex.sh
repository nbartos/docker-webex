#!/bin/bash

set -euo pipefail

docker build --tag=webex .
docker run --rm -ti \
	--env "DISPLAY=unix$DISPLAY" \
	--name=webex \
	--device /dev/snd \
	--device /dev/video0 \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	webex
