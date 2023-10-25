## mgrote.postfix

### Beschreibung
Installiert und konfiguriert postfix.

### getestet auf
- [x] Ubuntu (>=18.04)
- [x] Debian
- [x] ProxMox 6.1

### Variablen + Defaults
##### Wer soll die Mails bekommen.
``empfaenger_mail: michael.grote@posteo.de``
##### Nutzer
``postfix_absender_mailadresse: info@mgrote.net``
##### Passwort
``postfix_absender_passwort: FKXaOXXXXXX5kHC``
##### Soll nach Aufuehrung eines cronjobs eine Mail versendet werden?
``postfix_mail_nach_cronjob: false``
##### Netzwerke aus denen postfix Mails annimmt
``postfix_erlaubte_netzwerke: "127.0.0.0/8 192.168.2.0/24"``
