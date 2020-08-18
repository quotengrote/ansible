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

# ruft die function "exlock" auf, damit wird im lock verzeichnis die Datei "rclone.sh.lock" erstellt
# Damit prueft ob das Script ob es schon laeuft
exlock

dt=$( date +%Y_%m_%d__%H_%M_%S)
echo "--------------------------------------------------"
echo $(date)
####### ONEDRIVE
{{ rclone_pfad }} --config /etc/sicherung_cloud/rclone.conf -v sync --log-file="/var/log/sicherung_cloud.log"  --transfers 4 --checkers 8  --retries 5 --low-level-retries 10 --delete-after "/shares/Backup/NextCloud/Dokumente" "onedrive-encrypt:/Dokumente" --backup-dir "onedrive-encrypt:/old/Dokumente/$dt"

{{ rclone_pfad }} --config /etc/sicherung_cloud/rclone.conf -v sync --log-file="/var/log/sicherung_cloud.log"  --transfers 4 --checkers 8  --retries 5 --low-level-retries 10 --delete-after "/shares/Backup/NextCloud/Rest/KeepassDB" "onedrive-encrypt:/Rest/KeepassDB" --backup-dir "onedrive-encrypt:/old/Rest/$dt"



####### MEGA
{{ rclone_pfad }} --config /etc/sicherung_cloud/rclone.conf -v sync --log-file="/var/log/sicherung_cloud.log"  --transfers 4 --checkers 8  --retries 5 --low-level-retries 10 --delete-after "/shares/Backup/NextCloud/Dokumente" "mega-encrypt:/Dokumente"

{{ rclone_pfad }} --config /etc/sicherung_cloud/rclone.conf -v sync --log-file="/var/log/sicherung_cloud.log"  --transfers 4 --checkers 8  --retries 5 --low-level-retries 10 --delete-after "/shares/Backup/NextCloud/Rest/KeepassDB" "mega-encrypt:/Rest/KeepassDB"

{{ rclone_pfad }} --config /etc/sicherung_cloud/rclone.conf cleanup "mega-encrypt:"



#Hiermit wird die Lockdatei geloescht
unlock
