#!/bin/bash
for i in {a..z}; do
    {{ smart_smartctl_mail_pfad_smartctl }} /dev/sd$i -a
done
