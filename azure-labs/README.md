# ☁️ Parcours Azure Cloud Administrator

Ce dossier documente mes laboratoires pratiques et mes déploiements sur Microsoft Azure.

## 🎯 Objectifs
- Maîtriser les fondamentaux d'Azure (Compute, Networking, Storage, Identity).
- Concevoir et déployer des infrastructures sécurisées.
- Automatiser l'administration avec Azure PowerShell et Azure CLI.

---

## 📁 Laboratoires réalisés

### Lab 01 : Fondations Azure et Organisation des ressources
- **Objectif** : Créer une structure de base pour organiser les ressources cloud et maîtriser le portail Azure.
- **Ressources déployées** :
  - Groupe de ressources : `RG-Formation-Azure`
  - Région : `France Central`
  - Abonnement : `Azure for Students`
- **Compétences validées** :
  - Navigation dans Azure Portal et Azure Resource Manager (ARM).
  - Compréhension de la hiérarchie (Abonnement > Groupe de ressources > Ressources).
  - Application du principe de base de la facturation Azure.

### Lab 02 : Tentative de déploiement VM - Blocage par restriction de SKU
- **Objectif** : Déployer une VM Windows Server pour pratiquer l'administration.
- **Régions testées** : Germany West Central, Spain Central, Austria East, Denmark East.
- **Tailles testées** : B2ats_v2, B2pts_v2, B1s, DS1_v2, D2s_v3.
- **Erreur rencontrée** : `NotAvailableForSubscription` sur toutes les tailles éligibles à l'offre gratuite.
- **Diagnostic** : Restriction de SKU au niveau de l'abonnement Azure for Students, indépendante du quota vCPU et des régions autorisées par la Policy [citation:9][citation:15].
- **Action entreprise** : Ouverture d'une demande de support Microsoft pour vérifier l'éligibilité des SKU.
- **Compétence** : Compréhension de la différence entre quota, capacité régionale et restriction de SKU sur un abonnement Cloud.

### Lab 03 : Déploiement d'une VM Windows Server via Azure CLI (Contournement de restrictions étudiantes)

- **Objectif** : Déployer une VM Windows Server 2022 pour pratiquer l'administration à distance (RDP) et la gestion des services.
- **Problème rencontré** : Le portail graphique Azure bloquait la création de la VM avec l'erreur `NotAvailableForSubscription` pour toutes les tailles gratuites (B-Series v2) dans plusieurs régions (Germany West Central, Spain Central, Austria East, Denmark East).
- **Diagnostic** : 
  - Restrictions de SKU au niveau de l'abonnement Azure for Students.
  - Saturation de capacité dans la zone 3 de la région `SpainCentral`.
- **Solution** : Utilisation d'Azure Cloud Shell (CLI) pour forcer le déploiement avec les paramètres suivants :
  - **Région** : `spaincentral`
  - **Zone** : `1` (contournement de la zone 3 saturée)
  - **Taille** : `Standard_B2ats_v2`
  - **Image** : `MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest`
- **Commande utilisée** :
  ```bash
  az vm create \
    --resource-group RG-Formation-Azure \
    --name VM-WIN-LAB01 \
    --location spaincentral \
    --zone 1 \
    --size Standard_B2ats_v2 \

  ![VM Azure en cours d'exécution](lab03-vm-running.png)


  ### Lab 05 : Contrôleur de Domaine et Automatisation PowerShell

- **Infrastructure** :
  - VM Windows Server 2022 (Standard_B2ats_v2) déployée via Azure CLI dans la zone 1 de `spaincentral`.
  - Réseau virtuel `VNET-Formation` avec sous-réseau `SUBNET-SERVERS` (10.0.1.0/24).
- **Configuration** :
  - Promotion de la VM en Contrôleur de Domaine pour la forêt `lab.local`.
  - Configuration IP statique (10.0.0.4) et DNS local.
- **Automatisation** :
  - Création de l'OU `Lab-Users` et de 15 utilisateurs (`User01` à `User15`) via un script PowerShell.
- **Validation** :
  - Vérification de l'annuaire avec `Get-ADDomain` et `Get-ADUser`.
- **Compétence acquise** : Déploiement et administration d'un annuaire Active Directory dans le Cloud (Azure IaaS).
    --image MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest \
    --admin-username azureadmin \
    --admin-password "***" \
    --public-ip-sku Standard


### Lab 06 : Déploiement d'une VM Linux et Serveur Web Nginx

- **Objectif** : Déployer une VM Ubuntu sur Azure et installer un serveur web Nginx.
- **Ressources déployées** :
  - VM `VM-LINUX-LAB01` (Ubuntu 22.04 LTS, Standard_B2ats_v2).
  - IP publique : `68.221.175.9`.
- **Actions réalisées** :
  - Déploiement via Azure CLI avec génération automatique de clés SSH.
  - Connexion SSH sécurisée depuis Azure Cloud Shell.
  - Installation de Nginx via `apt`.
  - Vérification du service avec `systemctl status nginx` (actif et en cours d'exécution).
- **Compétence acquise** : Administration de serveurs Linux dans le Cloud et gestion de services web.

### Lab 09 : Azure Storage - Compte de stockage et partage de fichiers

- **Objectif** : Créer un compte de stockage Azure et y uploader un fichier.
- **Ressources créées** :
  - Compte de stockage : `stockageabdelilah2026` (Type : FileStorage, Région : Spain Central)
  - Partage de fichiers : `captures-lab` (5 Go)
- **Actions réalisées** :
  - Création du compte de stockage via le portail Azure.
  - Création du partage de fichiers via Azure CLI (`az storage share create`).
  - Upload d'un fichier via Azure CLI (`az storage file upload`), avec chiffrement côté serveur.
  - Vérification avec `az storage file list`.
- **Compétence acquise** : Gestion du stockage Cloud (Azure Files) et utilisation de l'Azure CLI pour contourner les limitations du portail web.
