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
  zfs_extra_zfs_pools:
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
  zfs_extra_zfs_pools:
    - { name: "ssd_vm_mirror", type: "ssd", cron_minute_zfs_trim: "5", cron_hour_zfs_trim: "22", cron_month_zfs_trim: "4,8,12", cron_day_zfs_trim: "2", cron_weekday_zfs_scrub: "6", cron_minutes_zfs_scrub: "0", cron_hour_zfs_scrub: "23"}
```


##### Samba Version
```
Possible values are :

CORE: Earliest version. No concept of user names.
COREPLUS: Slight improvements on CORE for efficiency.
LANMAN1: First modern version of the protocol. Long filename support.
LANMAN2: Updates to Lanman1 protocol.
NT1: Current up to date version of the protocol. Used by Windows NT. Known as CIFS.
SMB2: Re-implementation of the SMB protocol. Used by Windows Vista and later versions of Windows. SMB2 has sub protocols available.
SMB2_02: The earliest SMB2 version.
SMB2_10: Windows 7 SMB2 version.
SMB2_22: Early Windows 8 SMB2 version.
SMB2_24: Windows 8 beta SMB2 version.
By default SMB2 selects the SMB2_10 variant.

SMB3: The same as SMB2. Used by Windows 8. SMB3 has sub protocols available.
SMB3_00: Windows 8 SMB3 version. (mostly the same as SMB2_24)
SMB3_02: Windows 8.1 SMB3 version.
SMB3_10: early Windows 10 technical preview SMB3 version.
SMB3_11: Windows 10 technical preview SMB3 version (maybe final).
```
