#!/bin/bash

cd /usr/games/

# Install Ark
echo "Creating folder for ARK installation"
mkdir ark
echo "Trying to install / update ARK..."
./steamcmd +login anonymous +force_install_dir /usr/games/ark +app_update 376030 +quit

echo "Timeout 3 min..."
sleep 2000000000

echo "Starting server..."
/usr/games/ark/ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=example -server -log