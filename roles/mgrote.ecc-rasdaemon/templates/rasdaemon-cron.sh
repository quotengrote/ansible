#!/bin/bash
{{ file_header | default () }}
#####################
## https://www.tothenew.com/blog/foolproof-your-bash-script-some-best-practices/
set -o nounset
set -o errexit
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
(
echo "--------------------------------------------------"
echo $(date)
/usr/sbin/ras-mc-ctl --status
/usr/sbin/ras-mc-ctl --errors
) >> /var/log/rasdaemon.log 2>&1
