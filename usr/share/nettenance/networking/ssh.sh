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
	local uri=$(ssh_scheme "$*")
	[[ -n "$uri" ]] && echo ssh "$uri"

}


scp_command () {
	local uri=$(scp_scheme "$*")
	[[ -n "$uri" ]] && echo scp "$uri"


}
