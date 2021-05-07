#!/bin/sh

### BEGIN INIT TODO ADJUST
USER=user0
TMPDIR=/home/.saves/
### END INIT TODO ADJUST
cd / 
sudo sync
case "$1" in
     start)
         if [ -d $TMPDIR/$USER ]
         then               
                sudo rsync -a $TMPDIR/$USER/ /home/$USER/ --delete
                sudo rm -r -f /tmp/*
                echo "The homedir of $USER is now resetted!"
         else 
                echo "The Backup-Directory doesn't exists!"
         fi
         ;;
     save)
         if [ -d $TMPDIR/$USER ]
         then
                sudo rm -r $TMPDIR/$USER
         fi
                sudo mkdir -p $TMPDIR/$USER
                sudo rsync -a /home/$USER/ $TMPDIR/$USER/ --delete
                wait
         if [ -d $TMPDIR/$USER ]
         then
                echo "The home-dir of $USER was successfully saved to: $TMPDIR/$USER"
         else
                echo "Unfortunately, the backup operation was unsuccessful. Please repeat the command!"
         fi
         ;;
      chill)
         echo "Selfhealing deactivated!"
         ;;
      activate)
         sudo  sed -i 's/resethomedir.sh chill/resethomedir.sh start/g' /etc/init.d./resethomedirstart.sh
         sudo sed -i 's/SELFHEALING DEACTIVATED!/All local data will be lost during logout or restart!\\nMake sure your data is backed up in the cloud or on an external device if necessary./g' /usr/bin/setbackground.sh
         echo "Sealfhealing activated!"
      ;;
      deactivate)
         sudo  sed -i 's/resethomedir.sh start/resethomedir.sh chill/g' /etc/init.d./resethomedirstart.sh
         sudo sed -i 's/All local data will be lost during logout or restart!\\nMake sure your data is backed up in the cloud or on an external device if necessary./SELFHEALING DEACTIVATED!/g' /usr/bin/setbackground.sh
         echo "Sealfhealing deactivated!"
      ;;
      *)
         echo "Usage: $0 {start|save|deactivate|activate}"
         exit 1
         ;;
esac
exit 0
