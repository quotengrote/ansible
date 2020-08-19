<s># Verschlüsseln
ansible-vault encrypt /home/mg/ansible/inventories/group_vars/* --vault-password-file /home/mg/ansible/ansible-vault-password.yml
# Entschlüsseln
ansible-vault decrypt /home/mg/ansible/inventories/group_vars/* --vault-password-file /home/mg/ansible/ansible-vault-password.yml
# Schlüssel liegt in Keepas + Datei
- Datei ist bei .gitignore ausgenommen</s>

Die Secrets sind in einer KeepassDB gespeichert und werden über ein Lookup-Plugin abgerufen.
In der DB keine Ebenen und title = Variablenname.

restic_repository_password: "{{ lookup('keepass', 'restic_repository_password', 'password') }}"


Variabeln in Dictionarys vorher definieren
```
x = lookup

dict: z: x
```
```
  # Variable für Lookup
  lookup_var_postgres_user_and_db: "{{ lookup('keepass', 'postgres_user_and_db', 'password') }}"
  postgres_user_and_db:
    - { name_db: 'miniflux_db', name_db_user: 'miniflux_db_user', password_db_user: "{{ lookup_var_postgres_user_and_db }}" }
```
