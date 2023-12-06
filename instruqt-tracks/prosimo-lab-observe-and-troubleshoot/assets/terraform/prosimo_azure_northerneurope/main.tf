# initiate required Providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71.0"
    }
    prosimo = {
      source  = "prosimo-io/prosimo"
      version = "~> 3.9.0"
    }
  }
}

provider "azurerm" {

  #  alias = "eun"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  subscription_id            = var.azure_subscription_id
  client_id                  = var.azure_client_id
  client_secret              = var.azure_client_secret
  tenant_id                  = var.azure_tenant_id
  skip_provider_registration = "true"

}

provider "prosimo" {
  token    = var.prosimo_token
  insecure = true
  base_url = "https://${var.prosimo_team_name}.admin.prosimo.io"
}

module "prosimo_resource_azure" {
  source                   = "../modules/prosimo-resources"
  prosimo_teamName         = var.prosimo_team_name
  prosimo_token            = var.prosimo_token
  prosimo_cidr             = "10.253.0.0/23"
  cloud                    = "AZURE"
  apply_node_size_settings = "false"
  cloud1                   = "Prosimo_Azure"
  multipleRegion           = "northeurope"
  wait                     = "false"

}