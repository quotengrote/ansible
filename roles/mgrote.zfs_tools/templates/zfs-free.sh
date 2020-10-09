#! /bin/bash
watch --interval 60 --differences --color --no-title "sudo zfs list -o space | grep -v / | tr -s ' ' | cut --delimiter=' '  --fields=1-3 | sed -r 's/\s/\t\t/g;s/NAME/NAME\t/g'"
