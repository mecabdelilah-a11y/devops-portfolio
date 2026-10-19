#!/bin/bash

# ==========================================
# Script: backup-directory.sh
# Description: Sauvegarde un dossier dans une archive .tar.gz
# Auteur: Abdelilah Mechchat
# ==========================================

# 1. Variables
SOURCE_DIR="$HOME/devops-test"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# 2. Créer le dossier de sauvegarde s'il n'existe pas
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Dossier $BACKUP_DIR créé."
fi

# 3. Créer l'archive
echo "Création de la sauvegarde de $SOURCE_DIR..."
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# 4. Vérifier si l'archive a été créée
if [ -f "$BACKUP_FILE" ]; then
    echo "✅ Sauvegarde réussie : $BACKUP_FILE"
    ls -lh "$BACKUP_FILE"
else
    echo "❌ Erreur lors de la création de la sauvegarde."
    exit 1
fi
