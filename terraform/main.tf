# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
        azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.8.0"
    }
  }
}

provider "azuread" {
  client_id     = var.spn_object_id
  client_secret = var.spn_secret
  tenant_id     = var.tenant_id
  # use_microsoft_graph = false
}

provider "azurerm" {
  features {}

  client_id       = var.spn_object_id
  client_secret   = var.spn_secret
  tenant_id       = var.tenant_id
  subscription_id = var.sandbox_sub_id
}


provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}