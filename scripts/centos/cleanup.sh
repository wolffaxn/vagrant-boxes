#!/usr/bin/env bash

# clean up all yum caches
yum clean all

# remove temporary files
rm -rf *.iso
rm -rf /tmp/*

# clean up unused disk space
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY

sync
