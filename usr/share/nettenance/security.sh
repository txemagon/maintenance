# security.sh

# Accepts a file with only key-value pairs.
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

