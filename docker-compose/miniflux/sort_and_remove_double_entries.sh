#!/bin/bash

FILTERFILE=./filter.txt
VORHER=$(wc -l < $FILTERFILE)
echo Sortiere und filtere doppelte Zeilen heraus.
sort filter.txt | uniq -u -i | cat > .tmp
NACHHER=$(wc -l < .tmp)
echo Es wurden $((VORHER-NACHHER)) Zeilen  entfernt!
mv -f .tmp filter.txt
