## mgrote.sicherung_medien

### Beschreibung
Installiert und konfiguriert youtube-dl mit allen Hilfsprogrammen(ffmpeg).

Benoetigt mit hedii.youtube-dl.

Die Konfigurationsdaten liegen unter /usr/local/bin/youtube-dl.
Es wird ein Cronjob angelegt der taeglich das Script startet.

### Funktioniert auf
- [x] Ubuntu (>=18.04)

### Variablen + Defaults
#### hedii.youtube-dl
##### Ob Updates durchgefuehrt werden sollen
youtubedl_update: false
#### mgrote.sicherung_medien
##### Playlisten die gesichert werden sollen
    playlisten_youtube:
      - { url: 'https://www.youtube.com/playlist?list=PLPM-eyPokAWNhhDNO4YzC5cGRwuI2ykwE', titel: 'music'}
    playlisten_podcast:
      - { url: 'https://sternengeschichten.podigee.io/feed/aac', titel: 'Sternengeschichten'}
