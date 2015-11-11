#ssh.sh

# ssh utilities

# Generates the ssh connection string.
# $1: Associative array whith host port etc.
ssh_scheme () {

	eval "declare -A data="${1#*=}

	[[ -n "${data[host]}" ]] && 
    echo \
		     ${data[port]:+-p ${data[port]}}\
			 ${data[user]:+${data[user]}@}${data[host]}
}


# Generates the scp connection string.
# $1: Associative array whith host port etc.
scp_scheme () {

	eval "declare -A data="${1#*=}

	[[ -n "${data[host]}" ]] && 
    echo -n \
		     ${data[port]:+-P ${data[port]}}\
			 ${data[user]:+${data[user]}@}${data[host]}${data[path]:+:}
	echo ${data[path]}
}


ssh_command () {
	declare -a options
	while [[ ! "$1" =~ "declare" ]]; do
		options+=$1
		shift
	done
	local uri=$(ssh_scheme "$*")
	[[ -n "$uri" ]] && echo ssh "$(join_me " " ${options[@]}) $uri"

}


scp_command () {
	declare -a options
	while [[ ! "$1" =~ "declare" ]]; do
		options+=$1
		shift
	done

	local uri=$(scp_scheme "$*")
	[[ -n "$uri" ]] && echo scp "$(join_me " "  ${options[@]}) $uri"

}
