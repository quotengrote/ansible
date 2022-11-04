#!/bin/bash
ssh-keyscan -p {{ flux_repo_host_port }} {{ flux_repo_host }} > {{ flux_path_ssh_dir }}/known_hosts

flux bootstrap git --url={{ flux_repo_url_complete }} --interval={{ flux_sync_interval }} --branch={{ flux_repo_branch }} --path=cluster --kubeconfig {{ kubeconfig }} --private-key-file {{ flux_path_ssh_dir }}/{{ flux_path_ssh_id_file }} --silent
