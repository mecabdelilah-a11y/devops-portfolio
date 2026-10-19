
# On définit le provider (ici "local", qui agit sur ta machine)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

# On crée une ressource de type "fichier local"
resource "local_file" "mon_premier_fichier" {
  content  = "Ce fichier a été créé par Terraform !"
  filename = "${path.module}/hello-terraform.txt"
}
