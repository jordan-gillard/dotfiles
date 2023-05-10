# Set Zsh as the default shell
export SHELL=/bin/zsh

# Path to Oh My Zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set the theme to a fun Oh My Zsh theme that uses Powerline Fonts
ZSH_THEME="agnoster"

plugins=(
  git
  docker
  docker-compose
  nodenv
  npm
  nvm
  aliases
  dotenv
)

source $ZSH/oh-my-zsh.sh
