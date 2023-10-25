## mgrote.apcupsd

### Beschreibung
* Installiert apcupsd.
* Auf einem PC als "Master", hier ist die USV per USB angeschlossen.
* Auf allen anderen PCs als "Slave", diese OCs pollen alle <n> Sekunden den Master.
* Benoetigt mgrote.postfix.
* Getestet mit: APC-BX950U-GR

### Links
 * http://www.apcupsd.org/manual/#checking-your-configuration-file
 * https://linux.die.net/man/5/apcupsd.conf


### getestet auf
- [x] ProxMox 6.1
- [x] ProxMox 7

### Variablen + Defaults
- siehe [defaults/main.yml](./defaults/main.yml)
