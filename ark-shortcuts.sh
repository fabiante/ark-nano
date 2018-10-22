#!/bin/bash

# This script installs aliases into the .bashrc

echo "For highest comfort we recommend you to add your user to the docker group. Therefore you won't need sudo for docker commands anymore."
read -p "Do you agree with this? [Y|(N)]  " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo groupadd docker
  sudo gpasswd -a $USER docker
  newgrp docker
fi

cat <<EOT >> ~/.bashrc

# ark-nano aliases
alias ark='docker exec -it ark-nano /bin/bash'
alias ark-info="docker ps -f name=ark-nano --format 'Service \"{{.Names}}\" alias {{.ID}} has status: {{.Status}}'"
alias ark-stop='docker kill ark-nano'
alias ark-start='docker restart ark-nano'
alias ark-help="echo \"
ark        Go into the ark server
ark-info   Get short info about the ark server
ark-stop   Stop the ark server
ark-start  Restarts the ark server \""
EOT
