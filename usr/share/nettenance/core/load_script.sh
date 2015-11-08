#!/bin/bash
# load_script.sh

# Loads a bash script into a variable, performing parameter substitution.
#
# $1: script file to load.
# $*: Rest of parameters: parameters of the script file.
#
# Example:
#    $ load_script greet pepe juan
# Loads greet contents into a variable and substitute occurrences
# of $1 within the file with pepe, and $2s with juan.
load_script(){
	local script="$(< $1)"
	shift

	# The rest of parameters are to be passed to script file
	declare -i counter=0
	while [[ $@ > 0 ]];
	do
		((counter++))
		# Substitute $1, $2,... in the script file with current parameter ($1)
		script=${script//\$$counter/$1}
		shift
	done

	echo "$script"
}
