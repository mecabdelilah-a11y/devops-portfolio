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
