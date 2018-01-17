# enable bash-git-prompt if installed via homebrew
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_THEME="Custom"
  __GIT_PROMPT_DIR="$HOME/.bash-git-prompt/"
  source "$HOME/.bash-git-prompt/gitprompt.sh"
fi
