#!/bin/sh -eux

# update packages
echo "Updating packages"
yum clean all
yum update -y

# clean up all yum caches
echo "Cleaning up yum caches"
yum clean all

# clean up network devices
echo "Cleaning up network devices"
rm -f /etc/udev/rules.d/70-persistent-net.rules
/bin/find /etc/sysconfig/network-scripts -name "ifcfg-enp0s*" -exec rm -f '{}' +
/bin/find /var/lib/dhclient -type f -exec rm -f '{}' +

# remove hostname
echo "Removing hostname"
cat /dev/null > /etc/hostname

# disable IPv6
echo "Disabling IPv6"
echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network
echo "options ipv6 disable=1" > /etc/modprobe.d/disable-ipv6.conf

# disable Avahi
echo "Disabling Avahi"
systemctl disable avahi-daemon.service

# disable kdump
echo "Disabling kdump"
systemctl disable kdump.service

# remove temporary files
echo "Removing temporary files"
rm -rf *.iso
rm -rf /tmp/*

# zero out rest of free space
echo "Zero out rest of free space"
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
sync