## mgrote.proxmox_bind_mounts

### Beschreibung
Adds [bind-mounts](https://pve.proxmox.com/wiki/Linux_Container#pct_container_storage) for LXC-Container on Proxmox.

### tested on
- [x] ProxMox 7.*

### Variablen + Defaults
```
pve_bind_mounts:  # Dictionary
  - vmid: 105     # VMID for which the bind-mount should get created
    mp_nr: 1      # Number of the mountpoint
    mp_path_host: /rpool/test   # Path on the Host
    mp_path_guest: /klauspeter  # Path in the Guest
```
