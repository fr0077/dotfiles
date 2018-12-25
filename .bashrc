alias ls="ls -G"
alias diff="colordiff -y"
alias root="root -l"
alias gcc="ccache gcc"
alias clang="ccache clang"
alias g++="ccache g++"
alias clang++="ccache clang++"
alias vi="nvim"
alias view="nvim -R"
alias less="/usr/local/Cellar/neovim/0.3.1/share/nvim/runtime/macros/less.sh"
alias tree="tree -NC"
alias find="gfind"
alias dirs="dirs -v"
alias mccj="source mccj"
alias umccj="source umccj"
alias make="gmake"
alias bear="intercept-build"
alias c="pbcopy"
alias p="pbpaste"
alias python="python3"
alias top="top -o cpu"

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s dirspell
shopt -s shift_verbose

#fzf
export HISTCONTROL="ignoredups"
FZF_OPTIONS="--height 40% --reverse --border"
fzf-history() {
  local line=$(history | cut -c 7- | fzf $FZF_OPTIONS)
  if [[ -n $line ]]; then
    READLINE_LINE="$line"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
bind -x '"\C-r":fzf-history'

function fzf-z()
{
  local res=$(z | cut -c 12- | fzf $FZF_OPTIONS)
  if [[ -n $res ]]; then
    READLINE_LINE="cd $res"
    READLINE_POINT=${#READLINE_LINE}
  else
    return 1
  fi
}
bind -x '"\C-f":fzf-z'

eval $(thefuck --alias)
