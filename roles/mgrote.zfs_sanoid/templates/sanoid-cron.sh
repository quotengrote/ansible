#!/bin/bash
{{ file_header | default () }}
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

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
    exit 0
}


# Damit prueft ob das Script ob es schon laeuft
exlock

/usr/local/bin/sanoid --cron --verbose  | ts '%Y-%m-%d - %H-%M-%S' >> /var/log/sanoid-cron.log 2>&1 &

#Hiermit wird die Lockdatei geloescht
unlock
