#/bin/bash
# rcp_dir.sh

declare -A remote_dir=( [user]=$USER [host]=localhost [dir]='/'  )

display_usage() {
    echo "Copies a whole dir into another host"
    echo -e "\nUsage:\n $0 <local dir> <remote dir>"
}


parse_dir() {
    
    remote_dir[user]=${1%%@*}
    #remote_dir[host]=${1#@*:}
    echo ${remote_dir[user]}
}

if [ $# -le 1 ]
then
    display_usage
    exit 1
fi


last_param="${@:-1}"

if [[ ( $last_param == "--help") || ($last_param == "-h") ]]
then
    display_usage
    exit 0
fi

parse_dir $2
