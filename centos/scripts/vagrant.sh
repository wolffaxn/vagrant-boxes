#!/bin/bash

# add vagrant user
groupadd vagrant -g 1001
useradd vagrant -g vagrant -G wheel -u 1001
echo "vagrant" | passwd --stdin vagrant

# configure vagrant user in sudoers
echo "vagrant   ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i "s/^\(.*requiretty\)$/#\1/" /etc/sudoers

cat <<'EOF' > /home/vagrant/.bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc
export PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:$HOME/bin
EOF
chmod 0755 /home/vagrant/.bash_profile
chown vagrant /home/vagrant/.bash_profile
