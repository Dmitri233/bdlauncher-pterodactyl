#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# echo start command
echo -e ":/home/container$ ${STARTUP}"

# Run the Server
export WINEDLLOVERRIDES="vcruntime140_1,vcruntime140=n;mscoree,mshtml,explorer.exe,winemenubuilder.exe,services.exe,playplug.exe=d"
export WINEDEBUG=-all
${STARTUP}
