# Linux Cheatsheet - Abdelilah

## Navigation
- `pwd` : Affiche le chemin du dossier actuel.
- `ls -la` : Liste tout le contenu, y compris les fichiers cachés.
- `cd ~` : Retourne au dossier personnel.
- `cd ..` : Remonte d'un niveau.

## Fichiers et Dossiers
- `mkdir -p dossier1/dossier2` : Crée une arborescence de dossiers.
- `touch fichier.txt` : Crée un fichier vide.
- `rm -rf dossier` : Supprime un dossier et tout son contenu (ATTENTION : pas de corbeille !).
- `cp source destination` : Copie un fichier.
- `mv source destination` : Déplace ou renomme un fichier.

## Recherche et Texte
- `grep "erreur" /var/log/syslog` : Cherche le mot "erreur" dans les logs système.
- `cat fichier.txt` : Affiche le contenu.
- `less fichier.txt` : Affiche le contenu page par page (flèches pour défiler, 'q' pour quitter).

## Système et Processus
- `df -h` : Espace disque (format lisible).
- `free -h` : Mémoire RAM disponible.
- `top` ou `htop` : Moniteur de processus en temps réel.
- `ps aux` : Liste tous les processus.
- `kill -9 PID` : Tue un processus (remplace PID par le numéro).

## Permissions
- `chmod +x script.sh` : Rend un script exécutable.
- `chmod 755 fichier` : Donne tous les droits au propriétaire (lecture, écriture, exécution) et lecture/exécution aux autres.
