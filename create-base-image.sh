#!/bin/bash

set -euo pipefail

# Require running the whole script as root instead of individual sudo commands, because this can take a while and we
# don't want to have the process stopped in the middle waiting for a second sudo password prompt.
if [ "$USER" != "root" ]
then
    echo "You must run this script as root." >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C.UTF-8

rm -rf /tmp/image-creation-chroot
debootstrap --arch=i386 xenial /tmp/image-creation-chroot
cat > /tmp/image-creation-chroot/etc/apt/sources.list <<EOF
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ xenial main restricted universe multiverse
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ xenial-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu xenial-security main restricted universe multiverse
EOF
chroot /tmp/image-creation-chroot apt-get update
chroot /tmp/image-creation-chroot apt-get dist-upgrade -y
chroot /tmp/image-creation-chroot apt-get autoremove --purge -y
find /tmp/image-creation-chroot/var/cache/apt/ -mindepth 1 -delete
tar -C /tmp/image-creation-chroot -c . | docker import - ubuntu-16.04-32bit
rm -rf /tmp/image-creation-chroot
