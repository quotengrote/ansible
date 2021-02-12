#!/bin/bash
watch --interval 10 --differences --color --no-title "sudo hddtemp /dev/disk/by-id/ata-* | grep -v "part" | sed -r 's#(/dev/disk/by-id/ata-)([^:]+).*: ([0-9]{1,3}°C)#\3\t\2#g' | sort -n -r"
