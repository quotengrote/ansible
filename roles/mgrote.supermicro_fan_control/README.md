## mgrote.supermicro_fan_control

### Beschreibung
Setzt den Fan-Mode auf "Standard".
Setzt die Grenzwerte fur die Lüfterdrehzahlen passend für "beQuiet PureWings 2 140mm"

### getestet auf
- [X] ProxMox 7*


### Sonstiges
Setze Fan Speed für "CPU" auf 25%: `ipmitool raw 0x30 0x70 0x66 0x01 0x01 0x16`
Setze Fan Speed für "Case" 50%: `ipmitool raw 0x30 0x70 0x66 0x01 0x00 0x32`
Setze Fan-Threshold: `ipmitool sensor thresh "FAN5" lower 100 200 300`


    Locating sensor record 'FAN5'...
    Setting sensor "FAN5" Lower Non-Recoverable threshold to 100.000
    Setting sensor "FAN5" Lower Critical threshold to 200.000
    Setting sensor "FAN5" Lower Non-Critical threshold to 300.000


### Quellen
* https://forums.servethehome.com/index.php?resources/supermicro-x9-x10-x11-fan-speed-control.20/
* https://www.truenas.com/community/resources/how-to-change-ipmi-sensor-thresholds-using-ipmitool.35/
