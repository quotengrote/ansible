## mgrote.apt_manage_packages

### Beschreibung
Fuehrt:
`apt install {{ programme }}`
aus.
```yaml
  apt_packages_common:
    - locales
    - wird überall installiert
  apt_packages_physical:
    - hddtemp
    - nur auf Hardware-Maschinen
  apt_packages_vm:
    - qemu-guest-agent
    - nur in VMs
  apt_packages_extra:
    - Extra-Parameter für einzelne Hosts
```
Es wird unterschieden ob das Ziel eine VM ist oder nicht.

### getestet auf
- [x] Ubuntu (>=18.04)
- [x] Debian
- [x] ProxMox 6.1

### Variablen + Defaults
- siehe default/main.yml
