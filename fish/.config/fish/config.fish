function fish_title
  true
end

# ----------------------------
# Completions
# ----------------------------
uv generate-shell-completion fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/gilgamesh/opt/anaconda3/bin/conda
    eval /Users/gilgamesh/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/gilgamesh/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/Users/gilgamesh/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/gilgamesh/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

