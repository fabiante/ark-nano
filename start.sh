#!/bin/bash

cd /usr/games/

# Install Ark
echo "Creating folder for ARK installation..."
mkdir ark
echo "Trying to install / update ARK..."
./steamcmd +login anonymous +force_install_dir /usr/games/ark +app_update 376030 +quit

echo "Starting server..."
/usr/games/ark/ShooterGame/Binaries/Linux/ShooterGameServer Ragnarok?listen?SessionName=YourServerName?ServerPassword=PasswordForJoin?ServerAdminPassword=PasswordForAdmin -server -log
