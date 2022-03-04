#!/usr/bin/bash
sudo rsync -avz / --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*"} ithelfer@10.16.101.5:~/rsync --delete
