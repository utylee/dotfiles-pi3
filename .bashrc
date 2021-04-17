# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# x window server를 통해 vim client server 동작을 가능하게 하기 위함입니다.
export DISPLAY=:0
export GIT_EDITOR=vim

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color-italic) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

fast() {
	cp ~/printer.cfg.ultra-fast ~/printer.cfg
	echo sksmsqnwk11 | sudo -S service klipper restart
	echo
}

quality() {
	cp ~/printer.cfg.quality ~/printer.cfg
	echo sksmsqnwk11 | sudo -S service klipper restart
	echo
}

x5s() {
	cp ~/printer.cfg.x5s ~/printer.cfg
	echo sksmsqnwk11 | sudo -S service klipper restart
	echo
}

m() {
#echo $2 | mutt -s "$1" utylee@gmail.com -a "$3"
	echo $2 | mutt -s "$1" utylee@gmail.com
}

pretty() {
	git log "$1" --graph --all --pretty=format:"%Cblue%h%Creset [%Cgreen%ar%Creset] %s%C(yellow)%d%Creset"
}

vi0() {
	filename=$PWD/$1
	tmux send-keys -t vBLOG.0 ":e $filename" C-m
	tmux select-window -t vBLOG
	tmux select-pane -t vBLOG.0
}
vi1() {
	filename=$PWD/$1
	tmux send-keys -t vMISC.0 ":e $filename" C-m
	tmux select-window -t vMISC
	tmux select-pane -t vMISC.0
}
vir() {
	filename=$PWD/$1
	tmux send-keys -t vRust.0 ":e $filename" C-m
	tmux select-window -t vRust
	tmux select-pane -t vRust.0
}



alias dt='tmux detach -a'
alias t0='source ~/.tmuxset-blog'
alias tr0='source ~/.tmuxset-rust'
alias t1='source ~/.tmuxset-misc'
alias t2='source ~/.tmuxset-flask'
#alias vi0='vim --servername blog --remote '
#alias vi1='vim --servername misc --remote '

alias mygrep="grep -rn . --exclude={*.o,*.a,tags} -e "


#커서 색상을 변경합니다
echo -ne   '\eP\e]12;#859900\a'  # Cursor       -> green

#export CC=/usr/local/gcc-9.1.0/bin/gcc-9.1
#export CXX=/usr/local/gcc-9.1.0/bin/g++-9.1


export PYENV_ROOT="$HOME/.pyenv"
#export PATH="/usr/local/clang+llvm-5.0.1-armv7a-linux-gnueabihf/bin::$HOME/.cargo/bin:$PYENV_ROOT/bin:$PATH"
#export PATH="/usr/local/clang+llvm-9.0.0-armv7a-linux-gnueabihf/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/gcc-9.1.0/bin:/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$PATH"
#export PATH="/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$PATH"
#export PATH="/usr/local/clang+llvm-6.0.1-armv7a-linux-gnueabihf/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/gcc-9.1.0/lib:/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/lib:$LD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/usr/local/clang+llvm-7.0.1-armv7a-linux-gnueabihf/lib:$LD_LIBRARY_PATH"

#export PATH="$HOME/.cargo/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

set -o vi
export FZF_COMPLETION_TRIGGER='**'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore'
#export FZF_CTRL_T_COMMAND='rg --files /home/pi --hidden --follow --no-ignore'

#export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
