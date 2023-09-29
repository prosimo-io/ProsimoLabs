# initiate required Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    prosimo = {
      source  = "prosimo-io/prosimo"
      version = "3.1.2"
    }
  }
}

provider "prosimo" {
  token    = var.prosimo_token
  insecure = true
  base_url = "https://${var.prosimo_teamName}.admin.prosimo.io"
}


provider "aws" {
  region = "eu-west-1"
  alias = "eu-west-1"
  shared_credentials_files = ["./credentials"]
  profile = "default"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
  shared_credentials_files = ["./credentials"]
  profile = "default"
}

provider "aws" {
  region = "eu-west-1"
  alias = "eu-aws"
  shared_credentials_files = ["./credentials"]
  profile = "default"
}

provider "azurerm" {
  
  alias = "eun"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription
  client_id       = var.client
  client_secret   = var.clientsecret
  tenant_id       = var.tenantazure

}