# Set up the prompt
autoload -U colors && colors
autoload -Uz promptinit
promptinit

# Built-in prompts defined in /usr/share/zsh/<version>/functions
# "oliver" prompt definition, obtained via `echo $PS1`:
#     PROMPT='%B%F{default}%n %m:%~%$((COLUMNS-12))(l.%}. )[%h%1(j.%%%j.)%0(?..:%?)]%# %b%f%k'
# prompt oliver
PROMPT='%B%F{default}%n@%m:%~%$%# %b%f%k'

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# History configuration
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Use modern completion system
autoload -Uz compinit
compinit

# ls colors on BSD and MacOS
LSCOLORS="ExfxcxdxbxeggdabagEhEg"
export LSCOLORS
alias ls="ls -G"

# ls colors on Linux
# eval "$(dircolors -b)"          # OR:
# LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=36;43:su=30;41:sg=30;46:tw=1;34;47:ow=1;34;46"
# export LS_COLORS
# alias ls="ls --color"

# ls colors, universal settings
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gilgamesh/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gilgamesh/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gilgamesh/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gilgamesh/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Nix configuration settings
# This script needs to be executed in .zshrc to give precedence to .nix-profile applications.
# When the script is executed in .zshenv, the default system paths such as
# /usr/bin/ are prepended to the $PATH ahead of .nix-profile, which means the
# shell uses the system default instead of the Nix version.
if [ -e /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# CLAN commands path; some names may conflict with other programs
# export PATH="/Users/gilgamesh/Code/unix-clan/unix/bin:$PATH"
