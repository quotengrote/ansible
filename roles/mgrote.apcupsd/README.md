## mgrote.apcupsd

### Beschreibung
Installiert APCUPSD fuer eine APC UPS mit USB Verbindung.
Benoetigt mgrote.postfix-gmail.
https://linux.die.net/man/5/apcupsd.conf

### Funktioniert auf
- [x] ProxMox 6.1

### Variablen + Defaults
##### Wohin gehen die Benachrichtigungsmails bei Stromausfall
empfaenger_mail: michael.grote@posteo.de

##### Zeitspanne in Sekunden, ab der der Systemdienst einen Stromausfall annimmt. Nuetzlich, um sehr kurze Ausfaelle ignorieren zu koennen.
ONBATTERYDELAY: 10

##### Durch die USV gemeldete Restkapazitaet in Prozent, ab der der Rechner heruntergefahren wird
BATTERYLEVEL: 50

##### apcupsd will shutdown the system during a power failure when the remaining runtime on batteries as internally calculated by the UPS falls below the specified minutes.
MINUTES: 10

##### Specifies when apcupsd should create the nologon file to prevent users from logging on to the system.
NOLOGON: always
