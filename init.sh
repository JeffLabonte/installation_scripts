#!/bin/bash

sudo apt update && sudo apt install ansible neovim sshpass openssh-server -y && \
sudo systemctl start ssh
