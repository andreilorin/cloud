#!/usr/bin/bash

useradd "$1"
mkdir /home/"$1"
mkdir /home/"$1"/.ssh
chmod 700 /home/"$1"/.ssh
usermod -s /bin/bash "$1"
cp .ssh/authorized_keys /home/"$1"/.ssh/authorized_keys
chmod 400 /home/"$1"/.ssh/authorized_keys
chown "$1":"$1" /home/andrei/ -R

sed -i '/PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config