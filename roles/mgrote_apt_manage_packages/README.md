## mgrote.apt_manage_packages

### Beschreibung
Fuehrt:
`apt install {{ programme }}`
aus.
```yaml
  apt_packages_common:
    - wird überall installiert
  apt_packages_physical:
    - nur auf Hardware-Maschinen
  apt_packages_vm:
    - nur in VMs
  apt_packages_extra:
    - Extra-Parameter für einzelne Hosts
  apt_packages_internet:
    - für URLs
    - http://docker10.mgrote.net:3344/bash-helper-scripts-mgrote-latest.deb


```
Es wird unterschieden ob das Ziel eine VM ist oder nicht.

### getestet auf
- [x] Ubuntu (>=20.04)
- [x] ProxMox 7*

### Variablen + Defaults
- siehe [defaults/main.yml](./defaults/main.yml)
