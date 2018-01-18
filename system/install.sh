#!/bin/sh
upgrade_system () {
    sudo apt-get upgrade -y
}

user_packages () {
    sudo apt-get install tree tmux curl
}


upgrade_system
user_packages
