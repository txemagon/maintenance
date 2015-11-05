#ssh.sh

# ssh utilities

# $1: Associative array whith host port etc.
ssh_command () {
	eval "declare -A data="${1#*=}
    echo -e "ssh "
    if [[ -n "${data[port]}" ]]; then
    	echo -e " -p ${data[port]}"
    fi
    echo -e 
}