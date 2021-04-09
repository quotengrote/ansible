#!/bin/bash
{{ file_header | default () }}
#####################
## https://www.tothenew.com/blog/foolproof-your-bash-script-some-best-practices/
set -o nounset
set -o errexit
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
(
/usr/sbin/ras-mc-ctl --status | ts '%Y-%m-%d - %H-%M-%S'
/usr/sbin/ras-mc-ctl --errors | ts '%Y-%m-%d - %H-%M-%S'
) >> /var/log/rasdaemon.log 2>&1
