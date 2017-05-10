#!/usr/bin/env bash

# install EPEL repo on CentOS 7
cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/7/\$basearch
enabled=1
gpgcheck=0
EOM

# update packages
yum update -y

# clean up all yum caches
yum -y clean all

# disable reverse dns lookups in ssh (make ssh faster)
echo "UseDNS no" >> /etc/ssh/sshd_config
