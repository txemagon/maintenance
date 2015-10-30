# arguments.sh

# Check minimum number of arguments.
ensure_args () {

	declare -i args=$1
	declare -i total=$2
    if [[ $total -lt $args ]];
    then
        echo "Too few arguments. $args expected." >&2
        echo >&2
        display_usage >&2
        exit 1
    fi

}

# Assign colon separated key-value pairs to an associative array
# passed by reference.
# Param 1: Name of the associative array
# Param 2: Text to be parsed
hash_load () {
	{
    while read -r line || [[ -n "$line" ]]; do
        key=$(echo "$line" | tr -d ' ' | grep : | cut -d: -f1)
        value=$(echo "$line" | tr -d ' ' | grep : | cut -d: -f2)
        echo $1[$key]=\"$value\"
    done < "/dev/stdin"
    }

}