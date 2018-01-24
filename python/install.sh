info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

python_compilers () {
    sudo apt-get install libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev openssl -y
}

pyenv_install () {
    # Clone pyenv, clone pyenv-virtualenv
    PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    if [ ! -d $PYENV_ROOT ]; then
        git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT
        git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
    fi
}

info "Installing Python Modules"
python_compilers
pyenv_install
