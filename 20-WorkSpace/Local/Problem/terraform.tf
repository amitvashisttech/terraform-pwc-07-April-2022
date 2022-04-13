# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }

backend "local" { 
   path = "/var/tmp/terraform-backend-local-demo/terraform.tfstate"
 }
}
