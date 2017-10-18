autoload -U colors
colors     

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

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

# 
# Command Prompt
#
__git_dirty() { 
    git diff --quiet 2> /dev/null || echo '*'
}
__git_prompt() {
	branch=$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)
	[[ -n $branch ]] && echo " :: %{$fg_bold[white]%}$branch$(__git_dirty)%{$reset_color%}"
}

setopt prompt_subst

PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} :: %{$fg_bold[black]%}%(4~|...|)%3~%{$reset_color%}$(__git_prompt $__GIT_BEFORE $__GIT_AFTER) 
%{$fg[green]%}λ %{$reset_color%}'

# RPROMPT='%{$fg[green]%}%1(j.%j.)'
