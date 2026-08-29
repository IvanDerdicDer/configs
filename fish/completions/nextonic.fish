# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_nextonic_global_optspecs
	string join \n c/chatter= color= h/help V/version
end

function __fish_nextonic_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_nextonic_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_nextonic_using_subcommand
	set -l cmd (__fish_nextonic_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c nextonic -n "__fish_nextonic_needs_command" -s c -l chatter -d 'How much chatter to print when running' -r
complete -c nextonic -n "__fish_nextonic_needs_command" -l color -d 'Control colorization of output' -r -f -a "always\t''
auto\t''
never\t''"
complete -c nextonic -n "__fish_nextonic_needs_command" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_needs_command" -s V -l version -d 'Print version'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "build" -d 'Build a document'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "bundle" -d 'Commands relating to this document’s TeX file bundle'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "compile" -d 'Run a standalone (La)TeX compilation'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "dump" -d 'Run a partial compilation and output an intermediate file'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "new" -d 'Create a new document project'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "init" -d 'Initializes a new document in the current directory'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "show" -d 'Display various useful pieces of information'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "watch" -d 'Watch input files and execute commands on change'
complete -c nextonic -n "__fish_nextonic_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -l target -d 'Specify the target of the build.' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -s b -l bundle -d 'Use this URL to find resource files instead of the default' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -l untrusted -d 'Document is untrusted -- disable all known-insecure features'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -s C -l only-cached -d 'Use only resource files cached locally'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -s k -l keep-intermediates -d 'Keep the intermediate files generated during processing'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -l keep-logs -d 'Keep the log files generated during processing'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -s p -l print -d 'Print the engine\'s chatter during processing'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -l open -d 'Open built document using system handler'
complete -c nextonic -n "__fish_nextonic_using_subcommand build" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and not __fish_seen_subcommand_from cat search create help" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and not __fish_seen_subcommand_from cat search create help" -f -a "cat" -d 'Dump the contents of a file in the bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and not __fish_seen_subcommand_from cat search create help" -f -a "search" -d 'Filter the list of filenames contained in the bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and not __fish_seen_subcommand_from cat search create help" -f -a "create" -d 'Create a new bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and not __fish_seen_subcommand_from cat search create help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from cat" -s C -l only-cached -d 'Use only resource files cached locally'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from cat" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from search" -s C -l only-cached -d 'Use only resource files cached locally'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from create" -l job -d 'Which job we should run. `all` is default, but single jobs can be run on their own for debugging' -r -f -a "all\t'Run the following jobs in order'
select\t'(Stage 1) Select and patch all files in this bundle'
pack\t'(Stage 2) Pack selected files into a bundle'"
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from create" -l build-dir -d 'Build directory for this bundle. Will be removed' -r -F
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from create" -l allow-hash-mismatch -d 'If this flag is set, don\'t fail when an input\'s hash doesn\'t match the hash specified in the bundle\'s configuration file. This only has an effect when running jobs `all` or `select`'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "cat" -d 'Dump the contents of a file in the bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "search" -d 'Filter the list of filenames contained in the bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s f -l format -d 'The name of the "format" file used to initialize the TeX engine' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s b -l bundle -d 'Use this URL or path to find resource files instead of the default' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l outfmt -d 'The kind of output to generate' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l makefile-rules -d 'Write Makefile-format rules expressing the dependencies of this run to <dest_path>' -r -F
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l pass -d 'Which engines to run' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s r -l reruns -d 'Rerun the TeX engine exactly this many times after the first' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l hide -d 'Tell the engine that no file at <hide_path> exists, if it tries to read it' -r -F
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s o -l outdir -d 'The directory in which to place output files [default: the directory containing <input>]' -r -F
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s Z -d 'Unstable options. Pass -Zhelp to show a list' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s C -l only-cached -d 'Use only resource files cached locally'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s k -l keep-intermediates -d 'Keep the intermediate files generated during processing'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l keep-logs -d 'Keep the log files generated during processing'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l synctex -d 'Generate SyncTeX data'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s p -l print -d 'Print the engine\'s chatter during processing'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -l untrusted -d 'Input is untrusted -- disable all known-insecure features'
complete -c nextonic -n "__fish_nextonic_using_subcommand compile" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand dump" -s p -l profile -d 'Use the specified output profile for the partial build' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand dump" -l untrusted -d 'Document is untrusted -- disable all known-insecure features'
complete -c nextonic -n "__fish_nextonic_using_subcommand dump" -s C -l only-cached -d 'Use only resource files cached locally'
complete -c nextonic -n "__fish_nextonic_using_subcommand dump" -s s -l suffix -d 'Dump the file or files whose names end with the argument'
complete -c nextonic -n "__fish_nextonic_using_subcommand dump" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand new" -s b -l bundle -d 'Use this URL to find resource files instead of the default' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand new" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand init" -s b -l bundle -d 'Use this URL to find resource files instead of the default' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand init" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and not __fish_seen_subcommand_from user-cache-dir shell-completions help" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and not __fish_seen_subcommand_from user-cache-dir shell-completions help" -f -a "user-cache-dir" -d 'Print the location of the default per-user cache directory'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and not __fish_seen_subcommand_from user-cache-dir shell-completions help" -f -a "shell-completions" -d 'Print shell completions code for some given shell'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and not __fish_seen_subcommand_from user-cache-dir shell-completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and __fish_seen_subcommand_from user-cache-dir" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and __fish_seen_subcommand_from shell-completions" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and __fish_seen_subcommand_from help" -f -a "user-cache-dir" -d 'Print the location of the default per-user cache directory'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and __fish_seen_subcommand_from help" -f -a "shell-completions" -d 'Print shell completions code for some given shell'
complete -c nextonic -n "__fish_nextonic_using_subcommand show; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c nextonic -n "__fish_nextonic_using_subcommand watch" -s x -l exec -d 'Tectonic commands to execute on build [default: build]' -r
complete -c nextonic -n "__fish_nextonic_using_subcommand watch" -s h -l help -d 'Print help'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "build" -d 'Build a document'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "bundle" -d 'Commands relating to this document’s TeX file bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "compile" -d 'Run a standalone (La)TeX compilation'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "dump" -d 'Run a partial compilation and output an intermediate file'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "new" -d 'Create a new document project'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "init" -d 'Initializes a new document in the current directory'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "show" -d 'Display various useful pieces of information'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "watch" -d 'Watch input files and execute commands on change'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and not __fish_seen_subcommand_from build bundle compile dump new init show watch help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "cat" -d 'Dump the contents of a file in the bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "search" -d 'Filter the list of filenames contained in the bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "create" -d 'Create a new bundle'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and __fish_seen_subcommand_from show" -f -a "user-cache-dir" -d 'Print the location of the default per-user cache directory'
complete -c nextonic -n "__fish_nextonic_using_subcommand help; and __fish_seen_subcommand_from show" -f -a "shell-completions" -d 'Print shell completions code for some given shell'
