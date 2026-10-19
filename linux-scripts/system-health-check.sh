#!/bin/bash

# ==========================================
# Script: system-health-check.sh
# Description: Affiche l'état de santé du système (Disque, RAM, CPU)
# Auteur: Abdelilah Mechchat
# ==========================================

echo "=========================================="
echo "     RAPPORT DE SANTÉ DU SYSTÈME          "
echo "=========================================="
echo "Date de l'exécution : $(date)"
echo ""

# 1. Vérification de l'espace disque
echo "--- 1. UTILISATION DU DISQUE ---"
df -h | grep -v "tmpfs"
echo ""

# 2. Vérification de la mémoire RAM
echo "--- 2. UTILISATION DE LA MÉMOIRE (RAM) ---"
free -h
echo ""

# 3. Top 5 des processus consommant le plus de CPU
echo "--- 3. TOP 5 DES PROCESSUS (CPU) ---"
# L'option --sort=-%cpu trie par CPU décroissant, head -6 affiche l'en-tête + 5 lignes
ps aux --sort=-%cpu | head -6
echo ""

echo "=========================================="
echo "         FIN DU RAPPORT                   "
echo "=========================================="
