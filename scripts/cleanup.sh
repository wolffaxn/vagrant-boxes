#!/bin/sh -eux

yum -y clean all
rm -rf *.iso
rm -rf /tmp/*

sed -i 's/^HWADDR.*$//' /etc/sysconfig/network-scripts/ifcfg-enp0s3
sed -i 's/^UUID.*$//' /etc/sysconfig/network-scripts/ifcfg-enp0s3

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
sync
