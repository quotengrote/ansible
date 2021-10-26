#!/bin/bash
ssh mg@pve2.grote.lan "sudo pvesh get /pools/$1 --output-format yaml | grep -E lxc/[0-9]{3} | sed -r 's/[[:blank:]a-zA-Z\/\:]+//g' | sudo xargs -i --verbose  pct $2 {} && sudo pvesh get /pools/$1 --output-format yaml | grep -E qemu/[0-9]{3} | sed -r 's/[[:blank:]a-zA-Z\/\:]+//g' | sudo xargs -i --verbose  qm $2 {}"
