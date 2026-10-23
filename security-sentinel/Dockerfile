# On part d'une image Ubuntu officielle
FROM ubuntu:latest

# On installe les outils nécessaires (bash, procps pour top/free, coreutils pour df)
RUN apt-get update && apt-get install -y \
    bash \
    procps \
    coreutils \
    grep \
    && rm -rf /var/lib/apt/lists/*

# On crée un dossier de travail dans le conteneur
WORKDIR /app

# On copie tout le projet (scripts, config, etc.) dans le conteneur
COPY . .

# On rend le script exécutable
RUN chmod +x bin/sentinel.sh

# La commande qui sera exécutée au démarrage du conteneur
CMD ["./bin/sentinel.sh"]
