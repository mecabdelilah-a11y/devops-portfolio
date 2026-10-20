#!/bin/bash
FICHIER="exercices/access.log"
if [ ! -f "$FICHIER" ]
then
echo "erreur : le fichier $FICHIER est introuvable."
exit 1
fi
TOTAL=$(wc -l <  "$FICHIER")
ERREURS=$(grep -E " 500 | 401 | 403 " "$FICHIER" | wc -l)
echo "---Analyse des logs---"
echo "Nombre total de requetes : $TOTAL"
echo "Nombre total d'erreurs : $ERREURS"
