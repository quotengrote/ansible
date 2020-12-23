#!/bin/bash
# https://forum.rclone.org/t/bash-script-cronjob-for-automating-rclone-sync/13526/2
LOCKDIR=${HOME}/.cache
# Get an exclusive lock or exit
function exlock() {
    exec {lock_fd}>${LOCKDIR}/$(basename $0).lock
    flock -nx "$lock_fd"
    if [[ $? == 1 ]]; then
        exit 1
    fi
}
# Cleanup lock file and exit
function unlock() {
    rm "${LOCKDIR}/$(basename $0).lock"
    [[ -n $1 ]] && exit $1
    exit
}
# Damit prueft ob das Script ob es schon laeuft
exlock
{ #<-- ist keine Subshell sondern Grouping, https://askubuntu.com/questions/662190/write-the-output-of-multiple-sequential-commands-to-a-text-file
echo "--------------------------------------------------"
echo $(date)
mount -t cifs -o credentials="/etc/restic/smb_password.txt",vers=3.0 {{ restic_repository }} {{ restic_mount }}
restic -r {{ restic_mount }} --password-file /etc/restic/password.txt backup --exclude-file /etc/restic/exclude.txt {{ restic_folders_to_backup }}
retVal=$? #schreib Exit Code in Variable
umount {{ restic_mount }}
} >> /var/log/restic.log 2>&1;
echo $retVal
# Mail wenn Restix Exit != 0 #https://stackoverflow.com/a/45817972
if [ $retVal -ne 0 ]; then
    tail "/var/log/restic.log" | mail -s "ERROR - Restic - $HOSTNAME" {{ empfaenger_mail }}
fi
#Hiermit wird die Lockdatei geloescht
unlock
