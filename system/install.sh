#!/bin/sh
upgrade_system () {
    sudo apt-get upgrade -y
}

user_packages () {
    sudo apt-get install tree tmux curl
}

bash_git_prompt () {
    git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1
}

upgrade_system
bash_git_prompt
