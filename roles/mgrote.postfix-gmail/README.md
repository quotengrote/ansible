## mgrote.postfix-gmail

### Beschreibung
Installiert und konfiguriert postfix fuer den GMail.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [x] Debian

- [x] ProxMox 6.1

### Variablen + Defaults
##### Wer soll die Mails bekommen.
empfaenger_mail: michael.grote@posteo.de
##### Nutzer fuer GMail
nutzer_gmail: michael.grote@gmail.com
##### Passwort fuer GMail
passwort_gmail: FKXaOMOPv9bF5kHC
##### Soll nach Aufuehrung eines cronjobs eine Mail versendet werden?
mail_nach_cronjob: false
##### Netzwerke aus denen postfix Mails annimmt
postfix_gmail_erlaubte_netzwerke: "127.0.0.0/8 192.168.2.0/24"
