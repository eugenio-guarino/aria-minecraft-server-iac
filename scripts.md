## Player Time datapack configuration
```
# reset times
/scoreboard players reset * custom.total_world_time 

# hide action bar for all players
/execute as @a run trigger playtime_display set 0

# hide action bar for current player
/execute as @s run trigger playtime_display set 1

# show player times in hours
/scoreboard objectives setdisplay sidebar playtime_h

# remove all sidebars
/scoreboard objectives setdisplay sidebar
```

## Local Terraform Setup
```
gcloud auth application-default login
gcloud compute images export --destination-uri gs://aria-minecraft-server/images/aria-config-24-03-2024.tar.gz --image aria-server-24-03-2024

terraform init -reconfigure -backend-config="bucket=aria-minecraft-server" -backend-config="prefix=/terraform"
terraform destroy --target google_compute_image.aria_image
```

## format attached disk for the first time
```
sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb        
sudo mkdir -p /mnt/disks/aria-data-disk
sudo mount -o discard,defaults /dev/sdb /mnt/disks/aria-data-disk
```

## generate SA key script
```
openssl base64 -in yourfile.json -out output.txt
```

## docs links
https://cloud.google.com/compute/docs/disks/format-mount-disk-linux
https://github.com/marketplace/actions/telegram-notify
