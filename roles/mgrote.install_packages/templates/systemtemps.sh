#!/bin/bash
watch -n 10 --color --no-title "ipmitool sensor | cut -d '|' -f 1-3 | grep -i "degrees" | sort -k2 -r | sed -r 's/degrees C/°C/'"
