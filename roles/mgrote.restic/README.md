## mgrote.sicherung_cloud

### Beschreibung
Installiert und konfiguriert restic.
Die Konfigurationsdaten liegen unter /etc/restic.
Es wird ein Cronjob angelegt, bei dem die Minuten quasi-zufaellig auf Basis des Hostnamens generiert werden.
### Funktioniert auf
- [X] Ubuntu (>=18.04)
- [X] Debian
- [X] ProxMox 6.1

### Variablen + Defaults
##### Wohin wird der Share gemountet
restic_mount: /mnt/restic
##### NAS + Repository
restic_repository: //fileserver2.grote.lan/Backup/restic
##### Password fuer das Restic-Repository
restic_repository_password: xxxxxx
##### Stunden Cronjob
restic_cron_hours: 8,19
##### Nutzername fuer die Freigabe
restic_mount_user: restic
##### Password fuer die Freigabe
restic_mount_password: xxx
##### Welche Ordner sollen gesichert werden
restic_folders_to_backup: "/usr/local /etc /root /var/www /home /var/lib/docker/volumes"
