## mgrote.docker-compose-deploy

### Beschreibung
Klont Repositories und startet dir darin enthaltenen `docker-compose`-Projekte.
Abhängigkeiten werden nicht aufgelöst, z.B. fehlende Netze(`docker network create nw_proxy_traefik`)
Die `docker-compose.yml` mit im Repository-Root liegen.

### Getestet auf
- [x] Ubuntu (>=20.04)

### Variablen + Defaults
see [defaults](./defaults/main.yml)


### Benötigt
- `geerlingguy.docker`
