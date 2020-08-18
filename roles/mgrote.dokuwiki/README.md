## mgrote.dokuwiki

### Beschreibung
Installiert Dokuwiki (mit apache2 und php-fpm).
Es werden keine Einstellungen gesetzt
### Funktioniert auf
- [x] Ubuntu (>=18.04)

### Variablen + Defaults
##### Pfad zu Dokuwiki
  dokuwiki_install_path: /var/www/dokuwiki
##### Soll IMMER ein Update/Neuer Download durchgeführt werden
- Muss für den ersten Lauf aktiviert sein!
  dokuwiki_update: true
##### install.php behalten (für Ersteinrichtung)
  dokuwiki_install: false
### Beispiel Playbook
```yaml
---
- hosts: dokuwiki
  roles:
    - { role: mgrote.dokuwiki, tags: "dokuwiki" }
```


### Einrichtung danach...
#### entweder mit dem Assistenten einrichten
--> http://dokuwiki-test.grote.lan/install.php
#### oder die alten Dateien verwenden
Nach dem ausführen des Playbooks
alles in `/var/www/dokuwiki` löschen
`rm -rf * /var/www/dokuwiki/`
die alten Dateien nach "/var/www/dokuwiki" kopieren
`mv /home/mg/dokuwiki /var/www/`
die Dateirechte richtig setzen
`chown -R www-data /var/www/dokuwiki/`
