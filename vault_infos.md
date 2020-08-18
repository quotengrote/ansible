# Verschlüsseln
ansible-vault encrypt /home/mg/ansible/inventories/group_vars/* --vault-password-file /home/mg/ansible/ansible-vault-password.yml
# Entschlüsseln
ansible-vault decrypt /home/mg/ansible/inventories/group_vars/* --vault-password-file /home/mg/ansible/ansible-vault-password.yml
# Schlüssel liegt in Keepas + Datei
- Datei ist bei .gitignore ausgenommen
