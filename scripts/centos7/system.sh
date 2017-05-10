#!/usr/bin/env bash

# clean up network devices
rm -f /etc/udev/rules.d/70-persistent-net.rules
find /etc/sysconfig/network-scripts -name "ifcfg-enp0s*" -exec rm -f '{}' +
find /var/lib/dhclient -type f -exec rm -f '{}' +

# remove hostname
cat /dev/null > /etc/hostname

# disable IPv6
echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network
echo "options ipv6 disable=1" > /etc/modprobe.d/disable-ipv6.conf

# disable Avahi
systemctl disable avahi-daemon.service

# disable Chrony
systemctl disable chronyd.service

# disable Kdump
systemctl disable kdump.service
