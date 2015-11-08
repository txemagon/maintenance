#!/bin/bash
# setup_rcp_target.sh

# 
mkdir -p REMOTE_DIR; cd REMOTE_DIR; nc REMOTE_IP 8888 | pigz -d | tar xvf -"
