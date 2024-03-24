# terraform setup local

gcloud auth application-default login
gcloud compute images export --destination-uri gs://aria-minecraft-server/images/aria-config-24-03-2024.tar.gz --image aria-server-24-03-2024

terraform init -reconfigure -backend-config="bucket=aria-minecraft-server" -backend-config="prefix=/terraform"
terraform destroy --target google_compute_image.aria_image

# copy files from cloud storage to aria vm
gsutil -m cp -r gs://aria-minecraft-server/mods/* /mnt/minecraft-data/mods/
gsutil -m cp -r gs://aria-minecraft-server/data/* /mnt/disks/aria-data-disk/


# format attached disk for the first time
sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb        
sudo mkdir -p /mnt/disks/aria-data-disk
sudo mount -o discard,defaults /dev/sdb /mnt/disks/aria-data-disk


# generate SA key script
openssl base64 -in yourfile.json -out output.txt

# docs links
https://cloud.google.com/compute/docs/disks/format-mount-disk-linux
https://github.com/marketplace/actions/telegram-notify