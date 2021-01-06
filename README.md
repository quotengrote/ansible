# ansible_heimserver

## example-cli
ansible-playbook playbooks/base/0_master.yml  -i inventory --limit jenkins-test.grote.lan --key-file id_rsa_ansible_user --vault-pass-file vault-pass.yml


## install necessary collections
`ansible-galaxy collection install -r requirements.yml`

## list installed collections
`ansible-galaxy collection list -vvv`

## fix ansible vault-permissions
```
sudo chmod 400 id_rsa_ansible_user
sudo chmod 400 vault-pass.yml
```

## vault + KeePass LookUp-Plugin

### Einrichtung
Das Plugin wird bei einer Installation mit dem Playbook "ansible" mit eingerichtet.

Die "Secrets" liegen in der KeepassDB die mit dem Kennwort aus "vault-pass.yml" verschlüsselt ist.
"vault-pass.yml" steht mit in der .gitignore
Die Variable "vault_password_file" ist mit " ~/ansible/vault-pass.yml" in der ansible.cfg gesetzt.
Diese Datei enthält das Passwort mit dem die KeePassDb verschlüsselt ist.
Das vault-secret für die GroupVars wird mit `ansible-vault encrypt_string <password>` erstellt.

### Erklärung
  keepass_dbx: "./keepass_db.kdbx"
  keepass_psw: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          62383737XXXXXX531
1. mit vault-pass.yml wird das Kennwort an ansible-vault übergeben
2. ansible-vault entschlüsselt hiermit die variable "keepass_psw"
3. der Inhalt der Variable wird dann an das KeePass-Lookup-Plugin übergeben was damit die KeePass-Datei öffnet



### Abfrage der Secrets in tasks/playbooks
`restic_repository_password: "{{ lookup('keepass', 'restic_repository_password', 'password') }}"`

#### Erklärung
```
restic_repository_password:         <-- Ansible Variablen Name
lookup('keepass'                    <-- Aufruf Keepass-Lookup-Plugin
restic_repository_password          <-- Titel Eintrag mit Secret
password                            <-- Feldbzeichner in KeepassDB
```
