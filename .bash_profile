if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#Emacs
export PATH=/usr/local/cellar/emacs-mac/emacs-26.1-z-mac-7.1/bin:$PATH

#GSL
export GSL_I=/usr/local/Cellar/gsl/2.5/include
export GSL_L=/usr/local/Cellar/gsl/2.5/lib

#JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

#root
export PATH=$PATH:/Applications/root_v6.08.02/bin

#Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv

#Git
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(if [ $(id -u) -ne 0 ]; then echo  $(__g\
it_ps1) ; fi)\[\033[00m\] \$ '

#Qt
export PATH=$PATH:/usr/local/opt/qt5/bin

#GEANT4
export G4INSTALL=~/Applications/geant4.10.04.p02
export G4SYSTEM=Darwin-clang
export DGeant4_DIR=~/Applications/geant4.10.04.p02-install/lib/Geant4-10.4.2
source ~/Applications/geant4.10.04.p02-install/bin/geant4.sh

#LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
