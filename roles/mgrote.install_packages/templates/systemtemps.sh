#!/bin/bash
sudo ipmitool sensor | cut --delimiter '|' -f 1-3 | grep -i "degrees" | sort -k2 -r | tr --delete "|" | tr --squeeze-repeats " " | sed -r 's/(degrees C)/°C/g;s/([[:alnum:]]+[[:space:]][[:alpha:]]+ )([[:digit:]]+\.[[:digit:]]+ )(°C)/\2\t\3\t\1/g'
