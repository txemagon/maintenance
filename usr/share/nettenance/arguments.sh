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
