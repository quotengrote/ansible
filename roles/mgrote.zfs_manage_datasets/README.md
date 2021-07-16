## mgrote.zfs_manage_datasets

### Beschreibung
Erstellt Datasets/setzt Optionen pro Dataset.
Kann Datasets löschen.
Die Pools müssen vorher existieren.
Beim ersten ausführen wird es wahrscheinlich zu Status: "changed" kommen, weil:
```bash
ssd_vm_mirror/vm  xattr                 sa                     inherited from ssd_vm_mirror
ssd_vm_mirror/vm  xattr                 sa                     local
```
Die Attribute werden nicht mehr vererbt sondern als "local" gesetzt

### getestet auf
- [x] ProxMox 6.1

### Variablen + Defaults
#### Standardwerte
```
state:        present
compression:  lz4
sync:         standard
xattr:        on
dnodesize:    auto
atime:        off
snapdir:      hidden
```
#### Empfohlen für VMs
```
state:        present
compression:  lz4
sync:         disabled
xattr:        sa
dnodesize:    auto
atime:        off
snapdir:      hidden
```
