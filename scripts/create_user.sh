#!/bin/bash

if [ "$EUID" == "0" ] && [ "$USER_ID" != "0" ]
then 
  echo "USER_ID : $USER_ID"
  echo "GROUP_ID : $GROUP_ID"
  echo "USER_NAME : $USER_NAME"
  echo "GROUP_NAME : $GROUP_NAME"

  groupadd -g $GROUP_ID $GROUP_NAME
  useradd -s /bin/bash -g $GROUP_ID -u $USER_ID -o -c "container user" -m $USER_NAME
  chown $USER_NAME:$GROUP_NAME /home/$USER_NAME

  # Add user to docker group and start service
  if grep -qF 'docker' /etc/group
  then 
    usermod -aG docker $USER_NAME
    service docker start
  fi

  exec /usr/local/bin/gosu $USER_NAME "$@"
else
  $@
fi
