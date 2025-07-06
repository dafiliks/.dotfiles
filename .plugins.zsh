if [ ! -d "$HOME/.zsh" ]; then
    mkdir $HOME/.zsh
fi

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
fi

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ ! -d "$HOME/.zsh/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.zsh/zsh-history-substring-search
fi

source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

if [ ! -d "$HOME/.zsh/fzf-dir-navigator" ]; then
    echo "Installing fzf dir navigator."
    git clone https://github.com/KulkarniKaustubh/fzf-dir-navigator.git $HOME/.zsh/fzf-dir-navigator
fi

source $HOME/.zsh/fzf-dir-navigator/fzf-dir-navigator.zsh
