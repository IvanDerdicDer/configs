source /usr/share/cachyos-fish-config/cachyos-config.fish
set -p EDITOR nvim

if status is-interactive
    and not set -q TMUX
    tmux attach-session -t default 2>/dev/null; or tmux new-session -s default
end

fnm env --shell fish | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
# Added by LM Studio CLI tool (lms)
set -gx PATH $PATH /home/iderdic/.lmstudio/bin
