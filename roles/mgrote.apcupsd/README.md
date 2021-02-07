## mgrote.apcupsd

### Beschreibung
* Installiert apcupsd.
* Auf einem PC als "Master", hier ist die USV per USB angeschlossen.
* Auf allen anderen PCs als "Slave", diese OCs pollen alle n Sekunden den Master.
* Benoetigt mgrote.postfix.
* Getestet mit: APC-BX950U-GR

### Links
 * http://www.apcupsd.org/manual/#checking-your-configuration-file
 * https://linux.die.net/man/5/apcupsd.conf


### Funktioniert auf
- [x] ProxMox 6.1

### Variablen + Defaults
##### Zeitspanne in Sekunden, ab der der Systemdienst einen Stromausfall annimmt. Nuetzlich, um sehr kurze Ausfaelle ignorieren zu koennen. Jeweils Master und Slave.
```yaml
apcupsd_master_onbatterydelay: 10
apcupsd_slave_onbatterydelay: 10
```
##### Durch die USV gemeldete Restkapazitaet in Prozent, ab der der Rechner heruntergefahren wird. Jeweils Master und Slave.
```yaml
apcupsd_master_batterylevel_for_shutdown: 50
apcupsd_slave_batterylevel_for_shutdown: 60
```
##### apcupsd will shutdown the system during a power failure when the remaining runtime on batteries as internally calculated by the UPS falls below the specified minutes. Jeweils Master und Slave.
```yaml
apcupsd_master_minutes_for_shutdown: 10
apcupsd_slave_minutes_for_shutdown: 11
```
##### Specifies when apcupsd should create the NOLOGON file to prevent users from logging on to the system. Jeweils Master und Slave.
```yaml
apcupsd_master_nologon_when_active: always
apcupsd_slave_nologon_when_active: always
```

##### Ist der Server MASTER, also ist die USV an diesem Computer angeschlossen, kann nur für einen PC "true" sein. Jeweils Master und Slave.
```yaml
apcupsd_nis_master: "true"
```

##### Wenn "true" ist dieser Host master, für alle anderen "false", das muss nicht explizit gesetzt werden.
```yaml
apcupsd_nis_master: on
```

##### FQDN oder IP des "master"
```yaml
apcupsd_nis_master_hostname: pve2.grote.lan
```

##### Interface auf dem der "Master" erreichbar ist.
```yaml
apcupsd_nis_master_listen_ip: 0.0.0.0
```

##### Post auf dem der "Master" erreichbar ist.
```yaml
apcupsd_nis_master_listen_port: 3551
```

##### Name der USV
```yaml
apcupsd_ups_name: APC-BX950U-GR
```
