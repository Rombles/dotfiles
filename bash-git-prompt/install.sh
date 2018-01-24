info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

install_bgp () {
    if [ ! -d "$HOME/.bash-git-prompt" ]; then
        git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1
    fi
}

info "Installing Bash Git Prompt"
install_bgp
