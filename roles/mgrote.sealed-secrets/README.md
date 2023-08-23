# mgrote.sealed-secrets

Diese Rolle installiert das kubeseal-Binary und hinterlegt den Private-Key im Cluster.

## Verwenden des Secrets

```
- name: DRONE_RPC_SECRET
  valueFrom:
    secretKeyRef:
      name: NAME_DES_SECRETS
      key: ICH_BIN_DER VARIABLEN_NAME
```
