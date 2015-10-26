look_for () {
	local target_file=$1
	local dir_loc=NTT_LOC_$2
	local dir_sys=NTT_SYS_$2

	if [[ -f $target_file ]];
	then
	    echo "$target_file"
	elif [[ -f "`pwd`/$target_file" ]] ;
	then
	    echo "`pwd`/$target_file"
	elif [[ -f "$NTT_LOC_CONF/$target_file" ]] ;
	then
	    echo "$NTT_LOC_CONF/$target_file" ## Return value
	elif [[ -f "$NTT_SYS_CONF/$target_file" ]] ;
	then
	    echo "$NTT_SYS_CONF/$target_file" ## Return value
	elif [[ -f "${!dir_loc}/$target_file" ]]; # NTT_LOC_HOST or NTT_LOC_MNVR
	then
            echo "${!dir_loc}/$target_file"
	elif [[ -f "${!dir_sys}/$target_file" ]];
	then
            echo "${!dir_sys}/$target_file"
	else
	    echo "Error. $target_file file not found." >&2
	fi
}

check_existence_of () {

    local target=$1

    if [[ ! -f $target ]];
    then
        echo "Couldn't find file. $target" >&2
        echo >&2
        exit 1
    fi

}

find_dir () {
	local target_file=$1
	local dir_loc=NTT_LOC_$2
	local dir_sys=NTT_SYS_$2

	if [[ -d $target_file ]];
	then
	    echo "$target_file"
	elif [[ -d "`pwd`/$target_file" ]] ;
	then
	    echo "`pwd`/$target_file"
	elif [[ -d "$NTT_LOC_CONF/$target_file" ]] ;
	then
	    echo "$NTT_LOC_CONF/$target_file" ## Return value
	elif [[ -d "$NTT_SYS_CONF/$target_file" ]] ;
	then
	    echo "$NTT_SYS_CONF/$target_file" ## Return value
	elif [[ -d "${!dir_loc}/$target_file" ]]; # NTT_LOC_HOST or NTT_LOC_MNVR
	then
            echo "${!dir_loc}/$target_file"
	elif [[ -d "${!dir_sys}/$target_file" ]];
	then
            echo "${!dir_sys}/$target_file"
	else
	    echo "Error. $target_file dir not found." >&2
	fi
}
check_dir () {

    local target=$1

    if [[ ! -d $target ]];
    then
        echo "Couldn't find dir $target" >&2
        echo >&2
        exit 1
    fi

}
