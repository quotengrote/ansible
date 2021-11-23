#!/bin/bash
{{ file_header | default () }}

(
/usr/local/bin/cv4pve/cv4pve-autosnap --host=127.0.0.1 --api-token {{ cv4pve_api_user }}={{ cv4pve_api_token }} --vmid="{{ cv4pve_vmid }}" snap --label='daily' --keep="{{ cv4pve_keep_snapshots }}" --state  | ts '%Y-%m-%d - %H-%M-%S'
/usr/local/bin/cv4pve/cv4pve-autosnap --host=127.0.0.1 --api-token {{ cv4pve_api_user }}={{ cv4pve_api_token }} --vmid="all" status  | ts '%Y-%m-%d - %H-%M-%S'
) >> {{ cv4pve_logfile }} 2>&1
