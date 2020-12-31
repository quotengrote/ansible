## mgrote.fileserver

### Beschreibung
Installiert und Konfiguriert einen Fileserver mit Samba.
#### Rechte
Rechte im Dateisystem sind
  - `chown -R root:users /shares/`
  - `chmod -R 777 /shares/`
  - alle Nutzer sind Mitglied der Gruppe "users"
  - in Samba(global)
    - `force user = root`
    - `force group = users`

Damit werden die Nutzer mit Ihrem Konto auf die SAMBA-Freigabe berechtigt, aber die Lese/Schreiboperationen auf dem Dateisystem als "root" durchgefuehrt.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [ ] Debian


### Variablen
Es sind keine "defaults" gesetzt!
##### Anzulegende Nutzer mit Name, Gruppe, Passwort
  smb_nutzer:
    - { name: 'andreasgrote', groups: 'nutzer', password: 'hallowelt' }
##### um existierende Nutzer zu loeschen
  smb_nutzer_loeschen:
    - { name: '' }
##### zu erstellende Freigaben: mit Name, Ordnername, Basis-Ordner, Nutzer die lesen und schreiben duerfen
  smb_freigaben:
    - { freigabename: 'Backup', ordnername: 'Backup', base_folder: '/shares', lese_nutzer: '', schreibe_nutzer: 'annemariedroessler mg restic toolserver win10' }
##### Welche "Arbeitsgruppe"
  smb_workgroup: WORKGROUP


## Alternatives Dictionary Format:
```bash
  zfs_pools:
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
```bash
  zfs_pools:
    - { name: "ssd_vm_mirror", type: "ssd", cron_minute_zfs_trim: "5", cron_hour_zfs_trim: "22", cron_month_zfs_trim: "4,8,12", cron_day_zfs_trim: "2", cron_weekday_zfs_scrub: "6", cron_minutes_zfs_scrub: "0", cron_hour_zfs_scrub: "23"}
```
