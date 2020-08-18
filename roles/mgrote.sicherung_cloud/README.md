## mgrote.sicherung_cloud

### Beschreibung
Installiert und konfiguriert rclone.
Benoetigt dafuer "stefangweichinger.rclone".

Legt einen Cronjob an.

Laedt regelmaessig alle Ordner vom NAS(fileserver2.grote.lan) direkt, also vom Host auf MEGA und OneDrive hoch.

### Funktioniert auf
- [x] Ubuntu (>=18.04)

### Variablen + Defaults
##### Minuten wann das Script ausgefuehrt werden soll
rclone_cron_minutes: 30
##### Stunden wann das Script ausgefuehrt werden soll   
rclone_cron_hours: 22
##### Uploadgeschwindigkeitsbeschraenkung - Bandbreite in KBytes/s
rclone_bandbreite: 500
