## mgrote.systemd-timesyncd

### Beschreibung
Aktiviert ``systemd-timesyncd`` als NTP-Client.
Deaktiviert `ntpd` und `chrony`.

### getestet auf
- [x] Ubuntu (>=18.04)
- [ ] Debian
- [x] ProxMox 7*

### Variablen + Defaults
see [defaults](./defaults/main.yml)

### Tools
- `systemctl status systemd-timesyncd.service`
- `timedatectl timesync-status`
- `sudo journalctl -u systemd-timesync.service`
