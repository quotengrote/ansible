## mgrote.zfs_tools

### Beschreibung
Aktiviert die Mail Funktion von ZED (ZFS Event Daemon).
Setzt die maximale ARC-Groesse.
Benoetigt "mgrote.postfix".
Richtet regelmaessige Scrubs(jeden Sonntag) und Trim(alle 4 Monate) ein.
Richtet "zfs_health.sh", ein ZFS-Checkscript das auch Mails versendet bei Fehlern.
Deaktiviert das mitinstallierte scrub-Script in /etc/cron.d/zfsutils-linux.

### Funktioniert auf
- [x] ProxMox 6.1

### Variablen + Defaults
##### Wer soll die Mails bekommen
empfaenger_mail: michael.grote@posteo.de
zfs_pool: zfs_vm_mirror
##### Maximale Groesse ARC in Bytes
Beim aendern wird die Zeile einmal mit dem alten Wert und dem neuen Wert in die Zeile eingefuegt!
zfs_arc_max: "8589934592"
Die aenderung der maximalen ARC-Size wird erst nach einem Neustart uebernommen.
##### Ausfuehrung des ZFS_health-Scripts in Minuten
cron_minutes_zfs_health: "15"
cron_hours_zfs_health: "6,18"
##### Poolauflistung + Parameter
- u.A. fuer Cron fuer Trim und Scrub
Alle 4 Monate am 2. des Monats um 23:12
``- { name: "zfs_single_hdd", type: "ssd", cron_minute_zfs_trim: "12", cron_hour_zfs_trim: "23", cron_month_zfs_trim: "4,8,12", cron_day_zfs_trim: "3", cron_weekday_zfs_scrub: "0", cron_minutes_zfs_scrub: "0", cron_hour_zfs_scrub: "5"}``
Erst Poolname
Type: ssd/hdd; wenn der Wert SSD ist für ein Cronjobh angelegt der zfs-trim ausführt
Trim: Minute, Stunde, Monat, Tag des Monats
Scrub: Wochentag, Minute, Stunde
##### Pfad zu zpool-binary
pfad_zu_zpool: "/usr/sbin/zpool"
##### Füllstand für Warnmail
zfs_tool_max_cap: "80"
