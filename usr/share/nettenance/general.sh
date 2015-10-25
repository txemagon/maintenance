#!/bin/bash
# general.sh

NTT_CMD_NAME=$(basename "$0")
NTT_SHARED_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $NTT_SHARED_DIR/global_variables

include_sanitized () {
	local configfile=$1
	local configfile_secured='/tmp/sanitized.cfg'

    if egrep -q -v '^#|^[^ ]*=[^;]*' "$configfile"; then
      echo "Config file $configfile is unclean, cleaning it..." >&2
      # filter the original to a new file
      egrep '^#|^[^ ]*=[^;&]*'  "$configfile" > "$configfile_secured"
      configfile="$configfile_secured"
    fi

    . $configfile
}

display_version () {
    echo "$NTT_CMD_NAME - version $VERSION"
}


