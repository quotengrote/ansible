#! /bin/bash
watch --interval 60 --differences --color --no-title "zfs list -o space | grep -v /"
