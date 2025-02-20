#!/bin/bash

# Redirect both stdout and stderr to a file
exec > output.txt 2>&1

sudo su

# Mount minecraft data disk
mkdir -p /mnt/disks/aria-data-disk
mount -o discard,defaults /dev/sdb /mnt/disks/aria-data-disk

# Create scripts for server
mkdir -p /opt/scripts
gsutil -m cp -r gs://aria-minecraft-server/scripts/* /opt/scripts/

# Upgrade system packages
apt-get update
apt-get upgrade -y

# Install general packages
apt-get install -y git bc

# Install Ops Agent
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
bash add-google-cloud-ops-agent-repo.sh --also-install
rm add-google-cloud-ops-agent-repo.sh

# Add Docker's official GPG key
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# Install docker packages
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Run Minecraft docker image
docker run --privileged -d -v /mnt/disks/aria-data-disk/:/data \
    -e TYPE=FORGE -e MEMORY=28G -e DEBUG=true -e PVP=false \
    -e ENABLE_AUTOSTOP=TRUE -e AUTOSTOP_TIMEOUT_EST=350 \
    -e AUTOSTOP_TIMEOUT_INIT=600 -e ONLINE_MODE=false \
    -e VERSION=1.19.2 -e FORGE_VERSION=43.2.0 \
    -p 25565:25565 -e EULA=TRUE --name mc itzg/minecraft-server:java17

sleep 65s

# Send the IP address to the Telegram group
nohup bash /opt/scripts/send_ip_address.sh </dev/null &>/dev/null &

sleep 240s

# Auto-destroy when CPU usage is low
nohup bash /opt/scripts/auto_destroy.sh </dev/null &>/dev/null &
