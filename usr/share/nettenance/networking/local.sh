
# find the ip your using to connect to $1
# $1: ip or host you want to connect to.
my_ip_for () {
    ip -o route get $1 | \
    sed -n 's/.* src//p' - | \
    sed -n  's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/\nip&\n/gp' - | \
    grep ip | sed 's/ip//'| sort | uniq
}

# Can connect?
# $1: host
can_connect(){
    ping -c 1 -w1 "$1" &> /dev/null
    stat=$?
    echo "$stat" 1>&2
    return $stat
}

# Give me the ip
# $1: host
# Note:
# When ip passed returns the ip, weather reachable or not.
resolve_host(){
    getent ahosts "$1" | cut -d' ' -f1 | sort | uniq
}

# host exists?
# $1: host
host_exists(){
    [ -n "$(resolve_host $1)" ];
    return $?
}


# is an ip?  Discriminates if the string is an ip.
# $1: ip or host string.
is_an_ip(){
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}
