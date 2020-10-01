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

/usr/local/bin/ansible-playbook /home/mg/ansible/playbooks/for_cron.yml -i /home/mg/ansible/inventories/production 2>&1 | grep -A 20 "PLAY RECAP ******************************" > /home/mg/ansible/log.txt

cat /home/mg/ansible/log.txt | mail.mailutils --subject "Ansible-Cron Log" "michael.grote@posteo.de"

#Hiermit wird die Lockdatei geloescht
unlock
