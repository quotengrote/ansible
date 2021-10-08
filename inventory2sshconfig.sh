#!/bin/bash
# pruefe ob inventory gesetzt ist
if [ -n "$1" ]; then
	  var_inv=$1
else
	  var_inv="/home/mg/ansible/inventory"
fi
#pruefe ob ssh-config gesetzt ist
if [ -n "$2" ]; then
	  var_conf=$2
else
	  var_conf="/home/mg/.ssh/config"
fi
# loesche *.grote.lan Hosts und lege ein backup der Datei an
sed -i.bak -r '/[a-z0-9-]+.grote.lan/ d' $var_inv
# gebe Host aus Inventorie aus, entferne die erste Zeile, schreibe "Host"
# https://superuser.com/questions/246837/how-do-i-add-text-to-the-beginning-of-a-file-in-bash
echo "$(ansible all -i $var_inv --list-hosts | grep -v hosts | sed -e 's/^/Host /g' | cat - $var_conf)" > $var_conf
