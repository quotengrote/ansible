#!/bin/bash
{{ file_header | default () }}

chmod +x /home/mg/.config/bdfr/default_config.cfg

# These functions return exit codes: 0 = found, 1 = not found
# https://serverfault.com/questions/50585/whats-the-best-way-to-check-if-a-volume-is-mounted-in-a-bash-script
isMounted    () { findmnt -rno SOURCE,TARGET "$1" >/dev/null;} #path or device

#!/bin/bash
{{ file_header | default () }}
LOCKDIR=${HOME}/.cache # set lockdir
function exlock() { # define Function for setting lock; stops the script i a lock exists
    exec {lock_fd}>${LOCKDIR}/$(basename $0).lock
    flock -nx "$lock_fd"
    if [[ $? == 1 ]]; then
        exit 1
    fi
}
function unlock() { # define function for removing lock
    rm "${LOCKDIR}/$(basename $0).lock"
    [[ -n $1 ]] && exit $1
    exit
}

exlock # set lock
if isMounted "{{ bdfr_data_mount }}";
   then
      python3.9 -m bdfr clone {{ bdfr_data_path }} --no-dupes --search-existing --submitted --upvoted --saved --authenticate --user me
      python3.9 -m bdfr clone {{ bdfr_data_path }} --no-dupes --search-existing --subreddit SCPDeclassified
   else echo "share is not mounted"
      exit 1
fi

unlock # entferne lock
