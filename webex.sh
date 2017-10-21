#!/bin/sh

docker rm --force webex >/dev/null 2>&1
docker build --tag=webex .
#	--env DISPLAY=unix$DISPLAY \
#	--env XDG_RUNTIME_DIR=/tmp \
docker run -ti \
	--privileged \
	--name=webex \
	--volume /dev/snd:/dev/snd \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	webex $1
