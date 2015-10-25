#!/bin/bash
# arguments.sh


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
