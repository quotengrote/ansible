#!/bin/bash
LOCKDIR=${HOME}/.cache # set lockdir
function exlock() { # define Function for setting lock; stops the script i a lock exists
    exec {lock_fd}>${LOCKDIR}/$(basename $0).lock
    flock -nx "$lock_fd"
    if [[ $? == 1 ]]; then
        exit 1
    fi
}
function unlock() { # define function for removing lock
    rm "${LOCKDIR}/$(basename $0).lock"
    [[ -n $1 ]] && exit $1
    exit
}

exlock # set lock
abbruch_restic=0 # set counter for error

mount -t cifs -o credentials="/etc/restic/smb_password.txt",vers=3.0 {{ restic_repository }} {{ restic_mount }}  # mount share
mount_return_value=$? # schreib Exit Code in Variable
if ( [ "$mount_return_value" -ne 0 ] ); then
    {
    echo "--------------------------------------------------" # Trenner logfile
    echo $(date) # Datum für logfile
    echo "mount error"
    } >> /var/log/restic.log 2>&1;
    tail --lines=5 "/var/log/restic.log" | mail -s "Backup-Error - restic - $HOSTNAME" {{ empfaenger_mail }}
    exit 1
else
    {
    echo "--------------------------------------------------" # Trenner logfile
    echo $(date) # Datum für logfile
    echo "mount successful"
    } >> /var/log/restic.log 2>&1;
fi



while [[ "$abbruch_restic" -le {{ restic_anzahl_versuche_backup }} ]] # Schleife für Abbruchbedingung; um die eckikgen Klammern(Befehl "test") muss immer ein leerzeichen sein
do
    {  # ist keine Subshell sondern Grouping; https://askubuntu.com/questions/662190/write-the-output-of-multiple-sequential-commands-to-a-text-file
    echo "--------------------------------------------------" # Trenner logfile
    echo $(date) # Datum für logfile
    restic -r {{ restic_mount }} --password-file /etc/restic/password.txt backup --exclude-file /etc/restic/exclude.txt {{ restic_folders_to_backup }} # execute Backup
    restic_return_value=$? # schreib Exit Code in Variable
    if ( [[ "$restic_return_value" -eq 0 ]] ); # Prüfung ob restic erfolgreich war(setze Abbruchbedingung), wenn nicht warte 1min und zähle die Abbruchbedingung hoch
    then
        abbruch_restic=99
    else
        sleep {{ restic_wartezeit }}
        abbruch_restic=$(("$abbruch_restic" + 1))
    fi
  } >> /var/log/restic.log 2>&1; # leite die komplette Ausgabe in logfile um
done

umount {{ restic_mount }} >> /var/log/restic.log 2>&1;   # unmount


if ( [[ "$restic_return_value" -ne 0 ]] ); then # sende eMail wenn Restic Fehler ungleich 0, also Fehler; #https://stackoverflow.com/a/45817972
    tail --lines=50 "/var/log/restic.log" | mail -s "Backup-Error - restic - $HOSTNAME" {{ empfaenger_mail }} # schreibe die letzten 50 Zeilen aus dem Logfile in den Body der Mail
fi

unlock # entferne lock
