#login
fill -s '-  '
fortune
fill -s '-  '
echo

#alias
alias ls="ls -Gh"
alias diff="colordiff -y"
alias root="root -l"
alias vi="nvim"
alias view="nvim -R"
alias less="/usr/local/Cellar/neovim/0.3.4/share/nvim/runtime/macros/less.sh -u ~/.config/nvim/init-less.vim"
alias tree="tree -NC"
alias dirs="dirs -v"
alias mccj="source mccj"
alias umccj="source umccj"
alias bear="intercept-build"
alias c="pbcopy"
alias p="pbpaste"
alias top="top -o cpu"
alias gdb="gdb -q"

#setting
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s dirspell
shopt -s shift_verbose
set -b

#fzf
FZF_OPTIONS="--height 40% --border --reverse"
fzf-history() {
  local line=$(history | cut -c 8- | gtac|  fzf $FZF_OPTIONS)
  if [[ -n $line ]]; then
    READLINE_LINE="$line"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
bind -x '"\C-r":fzf-history'

function fzf-z()
{
  local res=$(z | cut -c 12- | gtac| fzf $FZF_OPTIONS)
  if [[ -n $res ]]; then
    READLINE_LINE+="$res"
    READLINE_POINT=${#READLINE_LINE}
  else
    return 1
  fi
}
bind -x '"\C-f":fzf-z'

#thefuck
eval $(thefuck --alias)
