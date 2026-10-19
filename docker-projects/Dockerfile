# On part d'une image de base Ubuntu officielle
FROM ubuntu:latest

# On met à jour les paquets et on installe les outils nécessaires
RUN apt-get update && apt-get install -y \
    bash \
    procps \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

# On crée un dossier de travail dans le conteneur
WORKDIR /app

# On copie ton script depuis ton PC vers le conteneur
COPY disk-space-alert.sh .

# On rend le script exécutable
RUN chmod +x disk-space-alert.sh

# La commande qui sera exécutée au démarrage du conteneur
CMD ["./disk-space-alert.sh"]
