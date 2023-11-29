## mgrote.zfs_sanoid

### Beschreibung
Installiert und konfiguriert ``sanoid`` + ``syncoid``.

Es gibt 3 Funktionen:

1. Snapshots erstellen und entfernen
2. Snapshots senden
3. Snapshots empfangen

### getestet auf
- ProxMox 7.*
- Ubuntu 20.04

### Variablen + Defaults
- see [defaults](./defaults/main.yml)


### Beispiel Playbook

```yaml
---
- hosts: host1,host2
  roles:
    - { role: mgrote_zfs_sanoid, tags: "sanoid" }
```

### Beispiel - Snapshots erstellen


#### Variablen

```yaml
---
  sanoid_snaps_enable: true
  sanoid_datasets:
    - path: 'hdd_data/videos'
      template: '31tage'
      recursive: 'yes'
      snapshots: true
  sanoid_templates:
    - name: '31tage'
      keep_hourly: '24'                        # Aufheben (Stunde)
      keep_daily: '31'                         # Aufheben (Tage)
      keep_monthly: '3'                        # Aufheben (Monate)
      keep_yearly: '0'                         # Aufheben (Jahre)
      frequently: '16'                         # Aufheben (Minuten)
      frequent_period: '15'                    # Intervall (alle 5 Minuten)
      autosnap: 'yes'                          # Automatisches erstellen von Snapshots
      autoprune: 'yes'

```

### Beispiel - Snapshots senden und empfangen

- Host 1 = Source
- Host 2 = Destination



#### Variablen - Host 1

```yaml
  sanoid_syncoid_source_host: true
  sanoid_syncoid_ssh_pubkey: |
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3U37DGPRPDLlgxZcM0Zj/x6RVZxs7hcWBYfPywujH4+mjbpzJckr2tx3QLfxsCCjQVb4LNSEB0xsOvzDjfDsaPuG4wzqFVyZOtjI4iWg/it4ARndun33r+xSlWc5JKHH9GRK8SBOd4lXv5ylENdhWQ7z5ZF/FtCysb1JHTTYlobgXfTZ4NswJj6BBk669l13uL6zSXq6x6vm1GWiFIcIYqwM5WGSGHFoD2RNn0TJKI9A3AULPloMzWeHG3fJhoVfNY6ZB0kqpTHGoAmJUURkBFki1cJkzx3tyto4VpTzZmUyYg+qqIWbv7Me3YVJCln8JYD10uDb2oPRx6G3C9DlnzRmAVVbqCHzwvOY0H5TLTW7AXCHHgSdHaRym4oTUY9dDS/XFU3rHgexerBbi3sy1Tm0/dEU3cZFm4YOJXY/l4TeTRlhg2VbctsWE1BN1CZcoJRR+qNdJzM7Vl70Y6RGU92Y1rzSpooYVuyCFDrEIp0hAHidb5rs4paCvoxtVqak+LK8dcq0IbWxcxomEimeRG4+Opd3vo+U6subp5jqkOY0uYkFVJXaMHkP5ZIxlCFgif2A3YAPhz9IczRJaaNY3pbVgU7ybOBp+S8KRK8Ysk6OP5ApOTQVTlRhYeNqo7mpuW6139VRY5luekSCy3ehHCI9/MObhu2juF1Nz0HMeMQ== mg@irantu
```


#### Variablen - Host 2

```yaml
  sanoid_syncoid_timer: '*:*'
  sanoid_syncoid_bwlimit: 30m
  sanoid_syncoid_datasets_sync:
    - source_host: host1.lan
      source_dataset: hdd_data_mirror
      destination_mount_check: hdd_data/encrypted # Wenn dieses Dataset nicht gemountet ist(z.B. durch Verschlüsselung, dann bricht syncoid ab)
      destination_dataset: hdd_data/encrypted/syncoid/zfs1
      skip_parent: false
  sanoid_syncoid_ssh_privkey: "{{ lookup('keepass', 'sanoid_syncoid_private_key', 'notes') }}"
  sanoid_syncoid_destination_host: true

```
