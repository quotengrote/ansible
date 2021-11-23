## mgrote.smart

### Beschreibung
Installiert und konfiguriert smartmontools + Mail-Benachrichtigungen.(Mail muss extra konfiguriert werden.)

Stellt `smart_status.sh` bereit.
Ausgabe:
```shell
mg@pve2 ~
> sudo smart_status.sh
Device Model:     SAMSUNG MZ7LH960HAJR-00005
SMART test result: PASSED
Device Model:     SAMSUNG MZ7LH960HAJR-00005
SMART test result: PASSED
Device Model:     WDC WD80EZAZ-11TDBA0
SMART test result: PASSED
Device Model:     WDC WD80EZAZ-11TDBA0
SMART test result: PASSED
Device Model:     WDC WD80EZAZ-11TDBA0
SMART test result: PASSED
Device Model:     MTFDDAK256MBF-1AN15ABHA
SMART test result: PASSED
```

### getestet auf
- [x] ProxMox 6*
- [x] ProxMox 7*

### Variablen + Defaults
- see [defaults](./defaults/main.yml)
