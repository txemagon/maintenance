# array.sh

# Array functions

function array_join { local IFS="$1"; shift; echo "$*"; }