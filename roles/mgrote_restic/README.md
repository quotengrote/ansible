## mgrote.restic

### Beschreibung
Installiert und konfiguriert restic.
Das Repository wird über (auto)mount-Units gemountet.
Das Backup wird über Timer-Units geplant.

Im Fehlerfall wird eine Mail verschickt.
Die Konfigurationsdaten liegen unter "{{ restic_conf_dir }}.

### getestet auf
- [X] Ubuntu (>=18.04)
- [] Debian
- [X] ProxMox 7*

### Variablen + Defaults
see [defaults](./defaults/main.yml)
