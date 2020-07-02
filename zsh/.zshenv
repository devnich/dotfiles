# Nix configuration settings
if [ -e /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Default editor
export EDITOR="emacs"

# Ripgrep search flags
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Allow use of Chrome devtools in Slack app
export SLACK_DEVELOPER_MENU=true
