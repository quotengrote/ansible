#! /bin/bash
{{ file_header | default () }}

problems=0
emailSubject="`hostname` - ZFS pool - HEALTH check"
emailMessage=""

# Health - Check if all zfs volumes are in good condition. We are looking for
# any keyword signifying a degraded or broken array.

condition=$(/sbin/zpool status | egrep -i '(DEGRADED|FAULTED|OFFLINE|UNAVAIL|REMOVED|FAIL|DESTROYED|corrupt|cannot|unrecover)')
if [ "${condition}" ]; then
  emailSubject="$emailSubject - fault"
  problems=1
fi



# Errors - Check the columns for READ, WRITE and CKSUM (checksum) drive errors
# on all volumes and all drives using "zpool status". If any non-zero errors
# are reported an email will be sent out. You should then look to replace the
# faulty drive and run "zpool scrub" on the affected volume after resilvering.

if [ ${problems} -eq 0 ]; then
  errors=$(/sbin/zpool status | grep ONLINE | grep -v state | awk '{print $3 $4 $5}' | grep -v 000)
  if [ "${errors}" ]; then
    emailSubject="$emailSubject - Drive Errors"
    problems=1
  fi
fi



# Notifications - On any problems send email with drive status information and
# capacities including a helpful subject line to root. Also use logger to write
# the email subject to the local logs. This is the place you may want to put
# any other notifications like:
#
# + Update an anonymous twitter account with your ZFS status (https://twitter.com/zfsmonitor)
# + Playing a sound file or beep the internal speaker
# + Update Nagios, Cacti, Zabbix, Munin or even BigBrother

if [ "$problems" -ne 0 ]; then
  logger $emailSubject
        echo -e "$emailSubject \n\n\n `/sbin/zpool list` \n\n\n `/sbin/zpool status`" | mail -s "$emailSubject" {{ empfaenger_mail }}
fi

### EOF ###
