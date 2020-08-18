## mgrote.sicherung_nextcloud

### Beschreibung
Installiert rclone fuer die Sicherung des NextClouds Servers: "mgrote.next-cloud.org".
Es werden nur die Daten von "michaelgrote" gesichert.
Die Daten werden per WebDAV kopiert.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [ ] Debian


### Variablen + Defaults
Es sind keine "defaults" gesetzt.
##### # Minuten wann das Script ausgefuehrt werden soll
nextcloud_sicherung_cron_minutes: 30
##### Stunden wann das Script ausgefuehrt werden soll
nextcloud_sicherung_cron_hours: 18
##### Pfad zu rclone (which)
pfad_zu_rclone: "/usr/local/bin/rclone"
##### Zielpfad
sicherung_nextcloud_ziel: "/shares/backup/NextCloud"
