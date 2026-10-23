# Security Sentinel

Un outil de surveillance système et de détection de sécurité, écrit en Bash et conteneurisé avec Docker.

## Fonctionnalités
- Surveillance du disque, de la RAM et du CPU.
- Détection des tentatives de connexion échouées (analyse de `/var/log/auth.log`).
- Génération de rapports horodatés dans le dossier `reports/`.
- Gestion des erreurs robuste (`set -euo pipefail`).

## Architecture
- `bin/sentinel.sh` : Script principal.
- `config/settings.conf` : Seuils d'alerte configurables.
- `Dockerfile` : Image Docker pour un déploiement portable.

## Utilisation
```bash
# Lancer le script localement
./bin/sentinel.sh

# Construire et lancer avec Docker
docker build -t security-sentinel .
docker run security-sentinel
