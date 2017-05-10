#!/usr/bin/env bash

# clean up all yum caches
yum -y clean all

# remove EPEL repos
rm -rf /etc/yum.repos.d/{epel}.repo

# remove temporary files
rm -rf *.iso
rm -rf /tmp/*
