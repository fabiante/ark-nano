#!/bin/bash

# This script installs and starts the newest ark server. Replace the values of the last line with your own ones.
# Prequesites: steamcmd

cd /usr/games/

# Install Ark
echo "Creating folder for ARK installation..."
mkdir ark
echo "Trying to install / update ARK..."
./steamcmd +login anonymous +force_install_dir /usr/games/ark +app_update 376030 +quit

# Starting Ark
echo "Starting server..."
/usr/games/ark/ShooterGame/Binaries/Linux/ShooterGameServer Ragnarok?listen?SessionName=YourServerName?ServerPassword=PasswordForJoin?ServerAdminPassword=PasswordForAdmin -server -log
