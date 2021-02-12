#!/bin/bash
LOCKDIR=${HOME}/.cache
function exlock() {
    exec {lock_fd}>${LOCKDIR}/$(basename $0).lock
    flock -nx "$lock_fd"
    if [[ $? == 1 ]]; then
        exit 1
    fi
}
function unlock() {
    rm "${LOCKDIR}/$(basename $0).lock"
    [[ -n $1 ]] && exit $1
    exit
}

exlock
(
echo $(date)
/usr/local/bin/cv4pve/cv4pve-autosnap --host=127.0.0.1 --api-token {{ cv4pve_api_user }}={{ cv4pve_api_token }} --vmid="{{ cv4pve_vmid }}" snap --label='daily' --keep="{{ cv4pve_keep_snapshots }}" --state
/usr/local/bin/cv4pve/cv4pve-autosnap --host=127.0.0.1 --api-token {{ cv4pve_api_user }}={{ cv4pve_api_token }} --vmid="all" status
) >> /var/log/cv4pve-autosnap.log 2>&1

unlock
