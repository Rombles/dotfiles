#!/bin/sh
upgrade_system () {
    sudo apt-get upgrade -y
}

python_compilers () {
    sudo apt-get install libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev openssl -y
}

user_packages () {
    sudo apt-get install tree tmux curl
}

bash_git_prompt () {
    git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1
}

pyenv_install () {
    # Clone pyenv, clone pyenv-virtualenv
    PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
}

upgrade_system
python_compilers
bash_git_prompt
pyenv_install
