alias ls="ls -G"
alias diff="colordiff -y"
alias root="root -l"
alias gcc="ccache gcc"
alias clang="ccache clang"
alias g++="ccache g++"
alias clang++="ccache clang++"
alias vi="nvim"
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

#peco
export HISTCONTROL="ignoredups"
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi  
    else
        history -d $((HISTCMD-1))
    fi  
}
bind -x '"\C-r":peco-history'

#zz
function peco-z()
{
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [[ -n $res ]]; then
    READLINE_LINE="cd $res"
    READLINE_POINT=${#READLINE_LINE}
  else
    return 1
  fi
}
bind -x '"\C-p":peco-z'
