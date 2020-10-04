#!/bin/bash

if [ -z "$1" ]; then
  echo "Please specify the new username"
else
  useradd -m -s /bin/bash "$1"
  mkdir /home/"$1"/.ssh
  chmod 700 /home/"$1"/.ssh
  cp .ssh/authorized_keys /home/"$1"/.ssh/authorized_keys
  chmod 400 /home/"$1"/.ssh/authorized_keys
  chown "$1":"$1" /home/"$1"/ -R

  rm .ssh/authorized_keys

  sed -i '0,/PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
fi