# History {{{
setopt sharehistory # man zshoptions /SHARE_HISTORY
setopt histignorealldups # Ignore duplicate commands
HISTSIZE=1000 # Keep 1000 lines of history within the shell 
SAVEHIST=1000
HISTFILE=~/.zsh_history # Save it to ~/.zsh_history:
# }}}
# Visual and GUI {{{
autoload -Uz colors
colors     

# Command Prompt
function __git_prompt {
	branch=$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)
	dirty=$(git diff --quiet 2> /dev/null || echo '*')
	if [[ -n $branch ]]; then
		if [[ -n $dirty ]]; then
			echo "%{$bg[yellow]%}%{$fg[black]%}$branch$dirty%{$reset_color%} "
		else
			echo "%{$bg[yellow]%}%{$fg[black]%}$branch$dirty%{$reset_color%} "
		fi
	fi
}

setopt prompt_subst
PROMPT='%{$bg[blue]%}%{$fg[black]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}Ϟ %{$reset_color%}'
RPROMPT='$(__git_prompt)%{$bg[green]%}%{$fg[black]%}%(4~|...|)%3~%{$reset_color%}'

# }}}

bindkey -e # Use 'emacs' keybindings


# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# vim:foldmethod=marker:foldlevel=0
