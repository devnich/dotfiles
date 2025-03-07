# ----------------------------
# Colors
# ----------------------------
# `ls` colors, universal settings
zstyle ':completion:*' list-colors ''
export CLICOLOR=1

# `ls` colors on Linux
# eval "$(dircolors -b)"          # OR:
# LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=36;43:su=30;41:sg=30;46:tw=1;34;47:ow=1;34;46"
# export LS_COLORS
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# `ls` colors on BSD and MacOS
LSCOLORS="ExfxcxdxbxeggdabagEhEg"
export LSCOLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}

# GNU/Linux coreutils (and therefor nix) color alias
alias ls="ls --color=auto --group-directories-first"
alias gls="gls -h --color=auto --group-directories-first"

# BSD color alias. Redundant if coreutils version of `ls` is installed
# alias ls="ls -G"

# Initialize colors
autoload -U colors && colors

# ----------------------------
# Prompt
# ----------------------------
# Built-in prompts defined in /usr/share/zsh/<version>/functions
# e.g., the "oliver" prompt definition, obtained via `echo $PS1`, is:
#   PROMPT='%B%F{default}%n %m:%~%$((COLUMNS-12))(l.%}. )[%h%1(j.%%%j.)%0(?..:%?)]%# %b%f%k'
# prompt oliver

# Prompt documentation here:
#   https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Visual-effects
# Codes for xterm-256 colors here:
#   https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
#   https://ss64.com/bash/syntax-colors.html

# Show path in prompt
PROMPT='%B%F{default}%n%F{red}@%F{default}%m:%F{022}%~%$%# %b%f%k'
# Don't show path in prompt
# PROMPT='%B%F{default}%n%F{red}@%F{default}%m: %b%f%k'

# Old extended prompt
# PROMPT='%B%F{default}%n@%m:%~%$%# %b%f%k'

# Initialize prompt
autoload -Uz promptinit
promptinit

# ----------------------------
# Completions
# ----------------------------
# Use modern completion system
autoload -Uz compinit
compinit

# More universal settings
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

# ----------------------------
# History
# ----------------------------
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
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

# ----------------------------
# Ergonomics
# ----------------------------
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# ----------------------------
# Nix settings
# ----------------------------
# Source Nix session variables
source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# The installer adds the following commands to the system zshrc. Unfortunately,
# MacOS operating system upgrades overwrite this file.

# Start Nix daemon
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# DEPRECATED: Give precedence to Nix-managed programs over system programs of
# the same name (e.g., `ls`)
# if [ -e /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh ]; then
#     . /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh
# fi

# ----------------------------
# Emacs
# ----------------------------
# Add shell integration for Emulate A Terminal [eat] package in Emacs
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && source "$EAT_SHELL_INTEGRATION_DIR/zsh"

# ----------------------------
# Python and uv
# ----------------------------
# Add uv autocompletion
eval "$(uv generate-shell-completion zsh)"

# Add uv-installed Pythons to the path
export PATH="/Users/gilgamesh/.local/bin:$PATH"

# ----------------------------
# Ruby
# ----------------------------
# Add Ruby Gems to path
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# ----------------------------
# Deprecated programs
# ----------------------------
# CLAN commands path; some names may conflict with other programs
# export PATH="/Users/gilgamesh/Code/unix-clan/unix/bin:$PATH"

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

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
# export MAMBA_EXE='/Users/gilgamesh/opt/bin/micromamba';
# export MAMBA_ROOT_PREFIX='/Users/gilgamesh/micromamba';
# __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
# fi
# unset __mamba_setup
# <<< mamba initialize <<<
