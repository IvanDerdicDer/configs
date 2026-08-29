# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_lac_global_optspecs
    string join \n machine= dry-run h/help V/version
end

function __fish_lac_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_lac_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_lac_using_subcommand
    set -l cmd (__fish_lac_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c lac -n "__fish_lac_needs_command" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_needs_command" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_needs_command" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_needs_command" -s V -l version -d 'Print version'
complete -c lac -n "__fish_lac_needs_command" -f -a "init" -d 'Generate the conf file at ~/.config/lac/config.yaml'
complete -c lac -n "__fish_lac_needs_command" -f -a "pull" -d 'Fetch/update the repo, show the diff, confirm, then distribute'
complete -c lac -n "__fish_lac_needs_command" -f -a "push" -d 'Show the diff of local changes, confirm, commit, then push'
complete -c lac -n "__fish_lac_needs_command" -f -a "status" -d 'Show local changes / diff (informational)'
complete -c lac -n "__fish_lac_needs_command" -f -a "list" -d 'Show the current machine\'s mapping'
complete -c lac -n "__fish_lac_needs_command" -f -a "completions" -d 'Print a shell completion script to stdout (bash, fish, zsh, ...)'
complete -c lac -n "__fish_lac_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c lac -n "__fish_lac_using_subcommand init" -l token -d 'Optional git token (only needed for private repos)' -r
complete -c lac -n "__fish_lac_using_subcommand init" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_using_subcommand init" -l force -d 'Overwrite an existing conf file without confirming'
complete -c lac -n "__fish_lac_using_subcommand init" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_using_subcommand init" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_using_subcommand pull" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_using_subcommand pull" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_using_subcommand pull" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_using_subcommand push" -l message -d 'Commit message' -r
complete -c lac -n "__fish_lac_using_subcommand push" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_using_subcommand push" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_using_subcommand push" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_using_subcommand status" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_using_subcommand status" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_using_subcommand status" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_using_subcommand list" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_using_subcommand list" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_using_subcommand list" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_using_subcommand completions" -l machine -d 'Machine name to operate on (overrides LAC_MACHINE and hostname)' -r
complete -c lac -n "__fish_lac_using_subcommand completions" -l dry-run -d 'Show what would be done without applying any changes'
complete -c lac -n "__fish_lac_using_subcommand completions" -s h -l help -d 'Print help'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "init" -d 'Generate the conf file at ~/.config/lac/config.yaml'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "pull" -d 'Fetch/update the repo, show the diff, confirm, then distribute'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "push" -d 'Show the diff of local changes, confirm, commit, then push'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "status" -d 'Show local changes / diff (informational)'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "list" -d 'Show the current machine\'s mapping'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "completions" -d 'Print a shell completion script to stdout (bash, fish, zsh, ...)'
complete -c lac -n "__fish_lac_using_subcommand help; and not __fish_seen_subcommand_from init pull push status list completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
