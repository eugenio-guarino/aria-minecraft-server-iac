#!/bin/bash
sudo su

# upgrade
apt update
apt upgrade -y

# install general packages
apt install -y git
apt install -y bc

# ops agent
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
bash add-google-cloud-ops-agent-repo.sh --also-install
rm add-google-cloud-ops-agent-repo.sh

# Install Docker
apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# create scripts for server
mkdir /opt/scripts
gsutil -m cp -r gs://aria-minecraft-server/scripts/* /opt/scripts/

# mount minecraft data disk
mkdir -p /mnt/disks/aria-data-disk
mount -o discard,defaults /dev/sdb /mnt/disks/aria-data-disk

# update mods
gsutil -m rsync -r -d gs://aria-minecraft-server/mods /mnt/disks/aria-data-disk/mods


# # run minecraft docker image
docker run --privileged -d -v /mnt/disks/aria-data-disk/:/data \
    -e TYPE=FORGE -e MEMORY=28G -e DEBUG=true -e PVP=false \
    -e ENABLE_AUTOSTOP=TRUE -e AUTOSTOP_TIMEOUT_EST=350 \
    -e AUTOSTOP_TIMEOUT_INIT=600 -e ONLINE_MODE=false \
    -e VERSION=1.19.2 -e FORGE_VERSION=43.2.0 \
    -p 25565:25565 -e EULA=TRUE --name mc itzg/minecraft-server:java17


sleep 90s

# # send out ip address
nohup bash /opt/scripts/notify.sh </dev/null &>/dev/null &

# # autodestroy when CPU usage is low
nohup bash /opt/scripts/auto_destroy.sh </dev/null &>/dev/null &

