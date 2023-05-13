# Path to Oh My Zsh installation
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sporty_256"

plugins=(
  git
  copyfile
  docker
  docker-compose
  nodenv
  npm
  nvm
  aliases
  dotenv
)

source $ZSH/oh-my-zsh.sh
