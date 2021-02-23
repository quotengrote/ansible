## mgrote.dokuwiki

### Beschreibung
Installiert Dokuwiki (mit apache2 und php-fpm).
Es werden keine Einstellungen gesetzt.

### Funktioniert auf
- [x] Ubuntu (>=18.04)

### Variablen + Defaults
see [defaults](./defaults/main.yml)

### Daten...
#### Backup einspielen
1. aus Restic wiederherstellen
2. in Archiv packen
3. Inhalt nach /var/www/dokuwiki entpacken
4. Rechte anpassen: chmod 755 /var/www/dokuwiki
5. Besitzer anpassen: chown www-data:www-data /var/www/dokuwiki

#### Wechsel OS/Maschine
##### auf altem PC
1. tar -czf dw_backup.tar.gz /var/www/dokuwiki
##### auf neuem PC
1. Archiv in /home/mg/backup_<data>.tar.gz abspeichern
2. Archiv in  /var/www verschieben: mv /home/mg/backup_<data>.tar.gz /var/www
3. entpacken: tar -xzf backup_<data>.tar.gz
4. Rechte anpassen: chmod 755 /var/www/dokuwiki
5. Besitzer anpassen: chown www-data:www-data /var/www/dokuwiki
