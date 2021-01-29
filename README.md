# ansible_heimserver

[![pipeline status](http://git.mgrote.net/mg/ansible/badges/master/pipeline.svg)](http://git.mgrote.net/mg/ansible/-/commits/master)


## Ansible KeePass Lookup Plugin aktualisieren
```bash
pip install 'pykeepass>3.2.0' --user
mkdir -p ~/.ansible/plugins/lookup && cd "$_"
curl https://raw.githubusercontent.com/viczem/ansible-keepass/master/keepass.py -o ./keepass.py
```
## collections als Dependency
- in meta
```
collections:
  - community.general
```

## defaults in Dictionary
```bash
- name: "register_runner"
  community.general.gitlab_runner:
    description: "{{ description|default('GitLab-Runner') }}"
```

```yaml
description: <-- Original-Variable
"{{ item.description| <-- Original-Inhalt
default('GitLab-Runner') }}" <-- wenn Inhalt leer, dann default...
```


## [playbook-grapher](https://github.com/haidaraM/ansible-playbook-grapher)
`ansible-playbook-grapher --include-role-tasks  tests/fixtures/with_roles.yml`

## example-cli
`ansible-playbook playbooks/base/0_master.yml  -i inventory --key-file id_rsa_ansible_user  --limit jenkins-test.grote.lan`

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
```yaml
  keepass_dbx: "./keepass_db.kdbx"
  keepass_psw: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          62383737XXXXXX531
```
1. mit vault-pass.yml wird das Kennwort an ansible-vault übergeben
2. ansible-vault entschlüsselt hiermit die Variable `keepass_psw`
3. der Inhalt der Variable wird dann an das KeePass-Lookup-Plugin übergeben was damit die KeePass-Datei öffnet

### Abfrage der Secrets in tasks/playbooks
`restic_repository_password: "{{ lookup('keepass', 'restic_repository_password', 'password') }}"`

#### Erklärung
```yaml
restic_repository_password:         <-- Ansible Variablen Name
lookup('keepass'                    <-- Aufruf Keepass-Lookup-Plugin
restic_repository_password          <-- Titel Eintrag mit Secret
password                            <-- Feldbzeichner in KeepassDB
```

## Inventory anzeigen
`ansible-inventory -i inventory --graph`

## Alternatives Dictionary Format:
```bash
  zfs_pool:
    - name: "ssd_vm_mirror"
      type: "ssd"
      cron_minute_zfs_trim: "5"
      cron_hour_zfs_trim: "22"
      cron_month_zfs_trim: "4,8,12"
      cron_day_zfs_trim: "2"
      cron_weekday_zfs_scrub: "6"
      cron_minutes_zfs_scrub: "0"
      cron_hour_zfs_scrub: "23"
```
ist das gleiche wie:

```yaml
  zfs_pool:
    - { name: "ssd_vm_mirror", type: "ssd", cron_minute_zfs_trim: "5", cron_hour_zfs_trim: "22", cron_month_zfs_trim: "4,8,12", cron_day_zfs_trim: "2", cron_weekday_zfs_scrub: "6", cron_minutes_zfs_scrub: "0", cron_hour_zfs_scrub: "23"}
```

## when: true
`Use when: var rather than when: var == True (or conversely when: not var)`
`when: dokuwiki_update # entspricht when: dokuwiki_update == true`

## Loop + Join
### Vars
```yaml
    mountpoint: "/shares"
    sources:
      - "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi1"
      - "/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi2"
    opts: defaults,allow_other,direct_io,use_ino,moveonenospc=true,category.create=mfs,minfreespace=100G
```

### Tasks

```yaml
  - name: "Join/Combine sources"
    set_fact:
      src: "{{sources |  join (':')}}"
    loop: "{{ sources }}"

  - debug:
      msg: "{{src}}"

  - name: "Mount mergerFS"
    mount:
      path: "{{ mountpoint }}"
      src: "{{ src }}"
      opts: "{{ opts }}"
      fstype: fuse.mergerfs
      state: mounted
```

## prüfen ob eine Datei existiert

```yaml
  - name: check if migration file exists
    stat:
      path: /etc/miniflux.d/.migration_successful
    register: migration_successful_existiert

  - name: dbug
    debug:
      msg: "{{ migration_successful_existiert }}"
    #output:
    # *
    #ok: [miniflux-test.grote.lan] => {
    #    "msg": {
    #      "changed": false,
    #      "failed": false,
    #      "stat": {
    #          "exists": false



#  - name: admin anlagen
#    shell:
#      cmd: miniflux -c /etc/miniflux.d/miniflux.conf -migrate
#    when: migration_successful_existiert.stat.exists == False

  - name: migration tocuh
    file:
      path: /etc/miniflux.d/.migration_successful
      state: touch
    when: migration_successful_existiert.stat.exists == False


  - name: check if update should be applied
    become: yes
    stat:
      path: "/root/pve-nag-buster/is_installed"
    register: "is_installed"

  - name: dbug
    debug:
      msg: "{{ is_installed }}"

  - name: Ordner "/root/pve-nag-buster" erstellen
    become: yes
    file:
      path: /root/pve-nag-buster
      state: directory
    when: not is_installed.stat.exists
```

### Siehe auch
  * https://stackoverflow.com/questions/35654286/how-to-check-if-a-file-exists-in-ansible
