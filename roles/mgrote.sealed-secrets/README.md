# mgrote.sealed-secrets

Diese Rolle installiert das kubeseal-Binary und hinterlegt den Private-Key im Cluster.

Der Key ist im Keepass im Eintrag unter "Notes" abgelegt. Sollten die Secrets neu verschlüsselt werden ist hier wieder der aktuelle Private-Key abzulegen.

Siehe: https://github.com/bitnami-labs/sealed-secrets#how-can-i-do-a-backup-of-my-sealedsecrets

## Backup

`kubectl get secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key -o yaml >main.key`

## Restore

```
kubectl apply -f main.key
kubectl delete pod -n kube-system -l name=sealed-secrets-controller
```


## Erstellen eines verschlüsselten Secrets

- Wichtig ist "stringData", wird nur "data" verwendet ist der Inhalt base64 zu enkodieren.

1. lege Secret mit Klartext VALUE als Datei() an
    ```
      kind: Secret
      apiVersion: v1
      metadata:
        name: NAME_DES_SECRETS
        namespace: drone
      stringData:
        ICH_BIN_DER VARIABLEN_NAME: ICH_BIN_DAS_PASSWORT
    ```
 2. diese Datei mit kubeseal verschlüsseln
    ```
    cat <datei> | kubeseal --controller-namespace kube-system --format yaml > sealed-secret.yaml
    ```
 3. den Inhalt dann als Secret im Repo ablegen ablegen

## Verwenden des Secrets

```
- name: DRONE_RPC_SECRET
  valueFrom:
    secretKeyRef:
      name: NAME_DES_SECRETS
      key: ICH_BIN_DER VARIABLEN_NAME
```
