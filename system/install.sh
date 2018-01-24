#!/bin/sh
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

upgrade_system () {
    sudo apt-get upgrade -y
}

user_packages () {
    sudo apt-get install vim tree tmux curl -y
}


info "Instalilng & Upgrading System"
upgrade_system

info "Installing User Packages"
user_packages
