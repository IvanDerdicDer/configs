if test (grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"') = cachyos
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end
 
set -p EDITOR nvim

if status is-interactive
    and not set -q TMUX
    tmux attach-session -t default 2>/dev/null; or tmux new-session -s default
end

if command -q fnm
    fnm env --shell fish | source
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end