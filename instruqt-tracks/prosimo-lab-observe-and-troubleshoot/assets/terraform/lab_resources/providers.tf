# initiate required Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
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

provider "prosimo" {
  token    = var.prosimo_token
  insecure = true
  base_url = "https://${var.prosimo_team_name}.admin.prosimo.io"
}


provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west-1"
  #  shared_credentials_files = ["./credentials"]
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_key_id
  profile    = "default"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
  #  shared_credentials_files = ["./credentials"]
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_key_id
  profile    = "default"
}

#provider "aws" {
#  region = "eu-west-1"
#  alias = "eu-aws"
#  shared_credentials_files = ["./credentials"]
#  profile = "default"
#}

provider "azurerm" {

  alias = "eun"
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
