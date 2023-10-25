## mgrote.users

### Beschreibung
Erstellt und konfiguriert Nutzer.

Basiert auf [ryandaniels/ansible-role-create-users](https://github.com/ryandaniels/ansible-role-create-users).

### getestet auf
- [x] Ubuntu (>=20.04)
- [x] ProxMox 7*

### Variablen + Defaults
```yaml
  users:
    - username: <Name>
      uid: <UID> # optional
      password: <encrypted-Pass> # mkpasswd --method=SHA-512 <passwort>
      shell: <Shell> # optional: default: /bin/bash
      update_password: <always|on_create> # optional
      groups: <group1, group2, ...> # optional
      createhome: <yes|no> # optional: default=yes
      state: <absent|present> # optional: default=present
      public_ssh_key: <SSH-KEY> # optional
      allow_sudo: true
      allow_passwordless_sudo: true
```
