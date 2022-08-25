# mgrote.docker-compose-inline

### Beschreibung

Diese Rolle templated docker-compose-Ordner auf die Zielmaschine und startet dort die Container.

### getestet auf

- [X] Ubuntu (>=20.04)

### Variablen + Defaults

siehe [defaults](./defaults/main.yml)

### Nutzung: Abbau Container

1. setze `state: absent`
1. lösche Ordner in `compose_src_basedir`
2. Rolle ausführen


### Nutzung: Hinzufügen Container

1. ersteller Ordner in `compose_src_basedir`
1. alle Dateien die templated werden sollen + IMMER `docker-compose.yml` mit der Dateiendung `.j2` versehen
1. Secrets: in `*.j2`-Dateien mit `{{ lookup('keepass', '<name>', 'password') }}
` einbauen
