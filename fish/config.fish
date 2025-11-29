if status is-interactive
	if test -z "$DISPLAY" -a "$XDG_VTNR" = "1"
		exec startx
	end

	if test -z "$TMUX" -a -n "$DISPLAY"
		tmux attach -t tmux 2>/dev/null; or tmux new -s tmux
	end

	alias vi="nvim"
	alias vim="nvim"

	set -U fish_greeting
end
