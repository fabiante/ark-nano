#!/bin/bash

cd /usr/games/

# Install Ark
echo "Trying to install / update ARK"
mkdir ark
./steamcmd +login anonymous +force_install_dir ./ark +app_update 376030 +quit