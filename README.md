# Personal Dotfiles

## Overview

These dotfiles are focused around topics. For example, everything under the `python/` directory pertains to configuring Python utilities like `pip` and asociated environment variables. Any file ending in `.symlink` will be symlinked into the home directory preceded by a `.` and without the `.symlink` suffix. For example, `gitconfig.symlink` will be symlinked as `$HOME/.gitconfig`. Any `env.sh` files will be sourced in your shell.

## Special Files and Directories

 * **`bin/`**: Anything in `bin/` will get added to `$PATH` and made available anywhere
 * **`<topic>/env.sh`**: Any `env.sh` files in a topic folder are sourced in your shell. This is a good place to put topic-specific environment variables, `$PATH` additions, or source other scripts.
 * **`topic/install.sh`**: Any `install.sh` files in a topic folder will be executed when running `script/install`. These scripts are used for doing any installation tasks beyond installing via Homebrew.
 * **`topic/*.symlink`**: Any file or directory ending in `*.symlink` will be symlinked in `$HOME` without the `*.symlink` extension and preceded by a `.`. For example, `ssh.symlink/` will get symlinked as `$HOME/.ssh/` and `python/pypirc.symlink` will get symlinked as `$HOME/.pypirc`.

## Usage

These dotfiles are meant to be useful as is, but you will have the best experience by forking this repo and making it your own by adding topic folders and keeping your changes in version control. To use, run the following:

```shell
git clone <repo url> ~/.dotfiles
cd ~/.dotfiles
script/bootstrap.sh

Borrowed liberally from https://github.com/holman/dotfiles.
