#!/usr/bin/env bash

# clean up unused disk space
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY

sync
