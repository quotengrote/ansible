## mgrote.set_apt_proxy

### Beschreibung
- Diese Rolle ersetzt die `/etc/apt/sources.list` mit einer Datei in der ein Apt-Cacher-NG gesetzt ist.

Rolle prüft mit `when: ansible_os_family == 'Ubuntu'` ob das Ziel auch Ubuntu ist.

- [x] Ubuntu (>=18.04)

### Variablen + Defaults
##### Apt-Cacher-NG Adresse
apt_proxy_server_hostname: acng.grote.lan
##### Apt-Cacher-NG Port
apt_proxy_server_port: 9999
