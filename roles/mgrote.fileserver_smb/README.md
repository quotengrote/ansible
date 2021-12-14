## mgrote.fileserver_smb

### Beschreibung
Installiert und konfiguriert einen Fileserver mit Samba.

#### Rechte
Rechte im Dateisystem sind
  - `chown -R root:users /shares/`
  - `chmod -R 777 /shares/`
  - alle Nutzer sind Mitglied der Gruppe "users"
  - in Samba(global)
    - `force user = root`
    - `force group = users`
Damit werden die Nutzer mit Ihrem Konto auf die SAMBA-Freigabe berechtigt, aber die Lese/Schreiboperationen auf dem Dateisystem als "root" durchgefuehrt.

### getestet auf
- [x] Ubuntu (>=20.04)

### Samba Version
```
Possible values are :
SMB2_02: The earliest SMB2 version.
SMB2_10: Windows 7 SMB2 version.
SMB2_22: Early Windows 8 SMB2 version.
SMB2_24: Windows 8 beta SMB2 version.
SMB3: The same as SMB2. Used by Windows 8. SMB3 has sub protocols available.
SMB3_00: Windows 8 SMB3 version. (mostly the same as SMB2_24)
SMB3_02: Windows 8.1 SMB3 version.
SMB3_10: early Windows 10 technical preview SMB3 version.
SMB3_11: Windows 10 technical preview SMB3 version (maybe final).
```

### Variablen
#### Nutzer
```
  smb_users:
    - name: 'annemariedroessler' # Nutzername
      password: "{{ lookup('keepass', 'fileserver_smb_user_amd', 'password') }}" # Passwort als Klartext
      state: present # Status(default: present)
      remove_dir: false # removes homedir if state is absent und remove_dir is true (default: false)
      ```

#### Freigaben
```
  smb_shares:
    - name: 'videos' # Freigabename
      path: '/shares_videos' # Pfad auf SMB-Server
      users_ro: ' win10 kodi' # Nutzer - Lesezugriff
      users_rw: 'annemariedroessler michaelgrote' # Nutzer - Schreibzugriff
```

### weitere Variablen + Defaults
siehe [defaults](./defaults/main.yml)
