#!/bin/sh -eux

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin

mkdir -p /home/vagrant/.ssh
# get vagrant insecure public key
curl -o /home/vagrant/.ssh/authorized_keys -kL 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

cat <<'EOF' > /home/vagrant/.bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc
export PATH=$PATH:$HOME/bin
EOF
