## mgrote.fileserver_mergerfs

### Beschreibung
Diese Rolle richtet mergerFS ein und mountet die ausgewaehlten Festplatten unter /mnt/HDD*.
Danach werden die Festplatten mit mergerFS unter /shares zusammengefasst.

Cave: Die Festplatten muessen vorher mit einem Dateisystem versehen sein. (mkfs.ext4 /dev/disk/by-id/XXXXX)

Erstellt einen Cronjob der "tree" ausfuehrt und unter "/root/tree/tree.txt" speichert.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [ ] Debian


### Variablen + Defaults
##### Mount Optionen
mount_optionen: defaults,allow_other,direct_io,use_ino,moveonenospc=true,category.create=mfs,minfreespace=100G,nonempty
##### wohin die Laufwerke gemountet werden sollen
mergerfs_mountpoint: "/shares"
##### Minuten wann "tree" ausgefuehrt wird
mergerfs_tree_cron_minutes: 30
##### Stunden wann "tree" ausgefuehrt wird
mergerfs_tree_cron_hours: 5
#####    Welche Festplatten gemountet UND eingebunden werden soll
- "ordner:XXX" <-- muss HDDx sein
- hier ist KEIN default gesetzt

```
sources:
      - { pfad: '/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi1', ordner: 'HDD1'}
      - { pfad: '/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi2', ordner: 'HDD2'}
      - { pfad: '/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi3', ordner: 'HDD3'}
      - { pfad: '/dev/disk/by-id/scsi-0QEMU_QEMU_HARDDISK_drive-scsi4', ordner: 'HDD4'}
```
