#!/usr/bin/bash
sudo rsync -avz ithelfer@10.16.101.5:~/rsync --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*"} / --delete
