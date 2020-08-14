# Nix configuration settings
# When this script is executed in .zshenv, the default system paths such as
# /usr/bin/ precede .nix-profile in the $PAT variable. This script should be
# executed in .zshrc to give precedence to .nix-profile applications.
# if [ -e /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/gilgamesh/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Default editor
export EDITOR="emacs"

# Ripgrep search flags
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Allow use of Chrome devtools in Slack app
export SLACK_DEVELOPER_MENU=true
