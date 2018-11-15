alias ls="ls -G"
alias diff="colordiff"
alias gcc="ccache gcc -std=c99"
alias clang="ccache clang"
alias g++="ccache g++"
alias clang++="ccache clang++"
alias vi="nvim"
alias less="/usr/local/Cellar/neovim/0.3.1/share/nvim/runtime/macros/less.sh"

set -o vi
bind '"jj": vi-movement-mode'
