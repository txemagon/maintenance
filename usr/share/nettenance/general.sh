#!/bin/bash
# general.sh

NTT_CMD_NAME=$(basename "$0")
NTT_SHARED_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $NTT_SHARED_DIR/global_variables
. $NTT_SHARED_DIR/version.sh
. $NTT_SHARED_DIR/security.sh
. $NTT_SHARED_DIR/config.sh
. $NTT_SHARED_DIR/strings.sh
. $NTT_SHARED_DIR/arguments.sh
