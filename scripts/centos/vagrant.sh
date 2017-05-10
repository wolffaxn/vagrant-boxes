#!/usr/bin/env bash

# add vagrant user
/usr/sbin/groupadd vagrant -g 1001
/usr/sbin/useradd vagrant -g vagrant -G wheel -u 1001
echo "vagrant" | passwd --stdin vagrant

# configure vagrant user in sudoers
echo "vagrant   ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i "s/^\(.*requiretty\)$/#\1/" /etc/sudoers

# install insecure public key
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

cat > /home/vagrant/.bash_profile << EOM
[ -f ~/.bashrc ] && . ~/.bashrc
export PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:$HOME/bin
EOM
chmod 0755 /home/vagrant/.bash_profile
chown vagrant /home/vagrant/.bash_profile
