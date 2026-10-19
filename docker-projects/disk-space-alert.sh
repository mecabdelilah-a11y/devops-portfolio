 #!/bin/bash

# ==========================================
# Script: disk-space-alert.sh
# Description: Vérifie l'espace disque et alerte si un seuil est dépassé.
# Auteur: Abdelilah Mechchat
# ==========================================

# 1. Définition des variables
THRESHOLD=80  # Seuil d'alerte en pourcentage
PARTITION="/" # La partition à surveiller (la racine)

echo "Analyse de l'espace disque pour la partition : $PARTITION"

# 2. Récupération de l'utilisation actuelle
# On utilise df, on filtre la partition, on enlève le signe '%', et on ne garde que le chiffre
USAGE=$(df -h | awk -v part="$PARTITION" '$6 == part {print $5}' | tr -d '%')

# Vérification si la commande a réussi à trouver la partition
if [ -z "$USAGE" ]; then
    echo "Erreur : Impossible de trouver la partition $PARTITION."
    exit 1
fi

echo "Utilisation actuelle : $USAGE%"

# 3. Condition : Si l'utilisation est supérieure ou égale au seuil
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "⚠️ ALERTE : L'espace disque est critique ! ($USAGE% utilisé, seuil à $THRESHOLD%)"
    # Dans un vrai environnement DevOps, on pourrait envoyer un email ou un message Slack ici.
    exit 2 # Code de sortie différent pour signaler l'alerte
else
    echo "✅ OK : L'espace disque est suffisant."
    exit 0
fi
