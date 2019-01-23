#z
source /usr/local/etc/profile.d/z.sh

#Compiler
export CXX=clang++
export CC=clang

#Haskell
export PATH=~/.local/bin:$PATH

#my_commands
LIBPATH=~/documents/programming/Library/shell
export PATH=$LIBPATH:$PATH

#Homebrew
export HOMEBREW_INSTALL_CLEANUP=1

#NeoVim
export EDITOR=/usr/local/bin/nvim

#JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

#Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv

#Git
source "$LIBPATH"/git-completion.sh
source "$LIBPATH"/git-prompt.sh
export PATH=/usr/local/Cellar/git/2.20.1/bin:$PATH
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(if [ $(id -u) -ne 0 ]; then echo  $(__git_ps1) ; fi)\[\033[00m\] \$ '

#Qt
export PATH=$PATH:/usr/local/opt/qt5/bin

#LLVM

#LLDB
#Required to use system python
export PATH=/usr/bin:$PATH
export PYTHONPATH=$PYTHONPATH:$(lldb -P)

#bash-completion
source /usr/local/share/bash-completion/bash_completion

#bash
export HISTCONTROL=erasedups
export TERM=xterm-256color
export PATH="/usr/local/sbin:$PATH"
source ~/.bashrc

