#!/bin/bash

show_help (){
  echo "Missing -d argument"
}

while getopts "d:" OPTION
do
  case $OPTION in
    d)
      DISTRO="$OPTARG"
      ;;
  esac
done

if [ -z $DISTRO ]; then
  show_help
  exit 1
fi


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $DISTRO \
   stable"

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose
sudo gpasswd -a $USER docker
sudo systemctl enable docker
