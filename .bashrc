#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi='vim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\u@\h:$(pwd)# '
