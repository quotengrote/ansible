#!/bin/bash
{{ file_header | default () }}
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

sudo /usr/local/bin/sanoid --cron --verbose  | ts '%Y-%m-%d - %H-%M-%S' >> {{ sanoid_log_file }} 2>&1 &
