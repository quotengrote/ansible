#!/bin/bash
#####################
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
#####################
# Damit prueft ob das Script ob es schon laeuft
exlock
#####################
(
echo "--------------------------------------------------"
echo $(date)
/usr/local/bin/youtube-dl --config-location "/etc/sicherung_medien/conf-podcast.txt"
) >> /var/log/sicherung_medien_podcast.log 2>&1

#####################
#Hiermit wird die Lockdatei geloescht
unlock
