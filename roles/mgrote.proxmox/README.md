## mgrote.proxmox

### Beschreibung
Installiert ein Script um komplette Poools zu starten/stoppen.

### Funktioniert auf
- [x] ProxMox 6.1

### Variablen + Defaults
see [defaults](./defaults/main.yml)

### Erklärung start_pools.sh
#### Argumente
`$1, $2, $n` = gleich Parameter in der Schreibreihenfolge nach dem Aufruf, also
`./pools.sh Test start`
`Test = $1`
`start = $2`
möglich: Poolnamen(case-sensitiv) & start/stop/shutdown

#### RegEx
`sudo pvesh get /pools/$1 |`  gibt alle VM/ct-Daten als JSON(?)-Objekt mit Formatierung aus
`sed -r 's#(,)#\n#g;s#\│##g;s#─##g;s#┴##g;s#└##g;s#┘##g;s#╞##g;s#╪##g;s#═##g;s#╡##g;s#\{##g;s#\}##g;s#\"*\"##g;s#\[##g;s#\]##g;s#id\:## g' |`  erstellt Zeilenumbrüche, entfernt Formatierung, formatiert Text für grep
`grep -E 'qemu/[[:digit:]]{3}' |`  sucht alle Zeilen aus die den Typ und die VMID enthalten
`sed -r 's#(qemu\/)([0-9]{3})#\2#g' | `   entfernt den Typ von der VMID
`sudo xargs -i  --verbose qm "$2" {}` übergibt VMIDs an das PVE-Kommando mit xargs
