if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
    tmux attach -t tmux || tmux new -s tmux
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
autoload -U colors && colors

setopt inc_append_history
setopt share_history

setopt histignorealldups

autoload -Uz select-word-style
select-word-style bash

zstyle ':completion:*' menu select
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

source $HOME/.plugins.zsh

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/cuda/bin
export PATH=$PATH:/usr/local/cuda/bin:/opt/cuda/bin
export PATH=$PATH:$HOME/.local/bin

command_not_found_handler () {
    if [ -x /usr/lib/command-not-found ]
    then
        /usr/lib/command-not-found -- "$1"
        return $?
    else
        if [ -x /usr/share/command-not-found/command-not-found ]
        then
            /usr/share/command-not-found/command-not-found -- "$1"
            return $?
        else
            printf "%s: command not found\n" "$1" >&2
            return 127
        fi
    fi
}

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

alias vim="nvim"
alias vi="nvim"

export EDITOR="/usr/bin/nvim"
