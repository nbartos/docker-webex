#!/bin/bash

set -euo pipefail

sudo rm -rf /tmp/image-creation-chroot
sudo debootstrap --arch=i386 xenial /tmp/image-creation-chroot
sudo tar -C /tmp/image-creation-chroot -c . | docker import - ubuntu-16.04-32bit
sudo rm -rf /tmp/image-creation-chroot
