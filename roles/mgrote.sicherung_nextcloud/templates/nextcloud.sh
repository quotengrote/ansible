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

exlock

{{ pfad_zu_rclone }} sync --config "/etc/nextcloud/rclone.conf" -v "nextcloud:/" "{{ sicherung_nextcloud_ziel }}" --log-file="/var/log/nextcloud-sicherung.log"


unlock
