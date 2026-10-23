#!/bin/bash
set -euo pipefail

# ==========================================
# Script: sentinel.sh
# Description: Outil de surveillance système
# Auteur: Abdelilah Mechchat
# ==========================================

# 1. Définir les chemins (le script est dans bin/, la config dans config/)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="$BASE_DIR/config/settings.conf"

# Rediriger toute la sortie vers un fichier de rapport avec la date
REPORT_FILE="$BASE_DIR/reports/audit_$(date +%Y-%m-%d_%H-%M-%S).txt"
exec > >(tee -a "$REPORT_FILE") 2>&1


# 2. Vérifier que le fichier de config existe
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Erreur : Fichier de configuration introuvable ($CONFIG_FILE)"
    exit 1
fi

# 3. Charger la configuration (récupère les variables)
source "$CONFIG_FILE"

echo "=========================================="
echo "   DÉMARRAGE DE L'AUDIT SECURITY SENTINEL "
echo "=========================================="
echo "Date : $(date)"
echo ""

# 4. Vérification du Disque
echo "--- 1. VÉRIFICATION DU DISQUE ---"
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "⚠️  ALERTE : Disque critique ! ($DISK_USAGE% utilisé, seuil à $DISK_THRESHOLD%)"
else
    echo "✅ OK : Disque sain ($DISK_USAGE% utilisé)."
fi
echo ""

# 5. Vérification de la RAM
echo "--- 2. VÉRIFICATION DE LA RAM ---"
RAM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

if [ "$RAM_USAGE" -ge "$RAM_THRESHOLD" ]; then
    echo "⚠️  ALERTE : RAM critique ! ($RAM_USAGE% utilisée, seuil à $RAM_THRESHOLD%)"
else
    echo "✅ OK : RAM saine ($RAM_USAGE% utilisée)."
fi
echo ""

# 6. Vérification du CPU
echo "--- 3. VÉRIFICATION DU CPU ---"
# On calcule le pourcentage d'utilisation du CPU (moyenne sur 1 seconde)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "⚠️  ALERTE : CPU critique ! ($CPU_USAGE% utilisé, seuil à $CPU_THRESHOLD%)"
else
    echo "✅ OK : CPU sain ($CPU_USAGE% utilisé)."
fi
echo ""
# 7. Vérification des tentatives de connexion échouées (Sécurité)
# 7. Vérification des tentatives de connexion échouées (Sécurité)
echo "--- 4. VÉRIFICATION DES CONNEXIONS ÉCHOUÉES ---"

FAILED_COUNT=0

# On cherche dans les fichiers de logs d'authentification standards
for LOG_FILE in /var/log/auth.log /var/log/secure; do
    if [ -f "$LOG_FILE" ]; then
        # On compte les lignes, on ignore les erreurs (2>/dev/null), et on prend le premier résultat
        COUNT=$(grep -c "Failed password" "$LOG_FILE" 2>/dev/null | head -n 1 || true)
        # On s'assure que COUNT est bien un nombre
        if [[ "$COUNT" =~ ^[0-9]+$ ]]; then
            FAILED_COUNT=$((FAILED_COUNT + COUNT))
        fi
    fi
done

if [ "$FAILED_COUNT" -ge "$MAX_FAILED_LOGINS" ]; then
    echo "🚨 ALERTE SÉCURITÉ : $FAILED_COUNT tentatives de connexion échouées détectées ! (Seuil : $MAX_FAILED_LOGINS)"
else
    echo "✅ OK : Aucune activité suspecte détectée ($FAILED_COUNT échecs)."
fi
echo ""
echo "=========================================="
echo "            FIN DE L'AUDIT                "
echo "=========================================="
