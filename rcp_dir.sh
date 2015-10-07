#/bin/bash
# rcp_dir.sh
# Oct, 2015. txema.gonz@gmail.com

declare -A remote_dir

IFACE="wlan0"

command="gnome-terminal"
init_task=" --tab -e "
S="\""
s="'"
b="bash -c "


local_command="tar -c OPTION0 | pv --size \`du -s OPTION0 | cut -f1\` | pigz -5 | nc -l 8888"
remote_command="mkdir -p REMOTE_DIR; cd REMOTE_DIR; nc REMOTE_IP 8888 | pigz -d | tar xvf -"


display_usage() {
    echo "Copies a whole dir into another host"
    echo -e "\nUsage:\n $0 <local dir> [user]@<host>:<remote dir>"
    echo "current user is used when not providing any."
    echo -e "\nExample:\n $0 mapa/ @172.17.1.200:/var/www"
}

# find my ip given iface
my_IP() {
    ifconfig $IFACE | grep 'inet:' | cut -d: -f2 | awk '{print $1}'
}

# Concatenates arguments using a specific separator (first argument)
simple_join() {
    local IFS="$1"
    shift
    echo "$*"
}


# Concatenates arguments using a specific separator (first argument)
join() {
    local sep=$1
    local arguments=$2
    for i in "${arguments[@]}"; do
        echo -n "$i$1"
    done
}

# Fetchs the first part of a string till separator
get_me() {
    echo ${2%%$1*}
}

# Strips the first part of a string till separator
strip_till() {
    echo ${2#*"$1"}
}

# Fill in remote_dir fields
parse_dir() {

    local dir=$1

    local result=$(get_me "@" $dir)
    remote_dir[user]=${result:-$USER}
    dir=$(strip_till "@" $dir)

    local result=$(get_me ":" $dir)
    if [ -z $result ]
    then
        echo "Host not provided."
        display_usage
        exit 1
    fi
    remote_dir[host]=$result
    dir=$(strip_till ":" $dir)

    remote_dir[dir]=$dir
}


# Show remote_dir values.
show_dir() {
    echo "User: ${remote_dir[user]}"
    echo "Host: ${remote_dir[host]}"
    echo "Dir : ${remote_dir[dir]} "
}


# Check number of params
if [ $# -le 1 ]
then
    display_usage
    exit 1
fi

# Look for help option
last_param="${@:-1}"

if [[ ( $last_param == "--help") || ($last_param == "-h") ]]
then
    display_usage
    exit 0
fi

# main
# local
local_dir=${1%/}
local_command=${local_command[0]//OPTION0/$local_dir}
command=$command$init_task$S$b$s$local_command
command+="; exec bash"$s$S

# remote
parse_dir $2 # Parse remote schema
my_ip=$(my_IP)
remote_command=${remote_command//REMOTE_DIR/${remote_dir[dir]}}
remote_command=${remote_command//REMOTE_IP/$my_ip}

command+=$init_task$S
command+="ssh -t ${remote_dir[user]}@${remote_dir[host]} "
command+=$s$remote_command
command+="; exec bash"$s$S

# Run everything
eval $command
