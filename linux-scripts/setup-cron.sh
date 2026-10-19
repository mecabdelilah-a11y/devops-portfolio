#!/bin/bash

# ==========================================
# Script: setup-cron.sh
# Description: Ajoute automatiquement la tâche de sauvegarde dans le crontab.
# Auteur: Abdelilah Mechchat
# ==========================================

CRON_JOB="0 2 * * * /home/abdou/devops-test/backup-directory.sh >> /home/abdou/backups/backup.log 2>&1"

echo "Configuration de la tâche cron pour la sauvegarde..."

# Vérifier si la tâche existe déjà pour éviter les doublons
if crontab -l 2>/dev/null | grep -qF "$CRON_JOB"; then
    echo "⚠️  La tâche cron existe déjà. Aucune modification."
else
    # Ajouter la tâche au crontab existant
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "✅ Tâche cron ajoutée avec succès !"
    echo "La sauvegarde s'exécutera tous les jours à 2h00 du matin."
fi

echo "Pour vérifier, tapez : crontab -l"
