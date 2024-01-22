# initiate required Providers
terraform {
  required_providers {
    prosimo = {
      source  = "prosimo-io/prosimo"
      version = "~> 3.10.0"
    }
  }
}

provider "prosimo" {
  token    = var.prosimo_token
  insecure = true
  base_url = "https://${var.prosimo_team_name}.admin.prosimo.io"
}

# Onboard CSP Account into Prosimo Dashboard

resource "prosimo_cloud_creds" "aws" {
  cloud_type = "AWS"
  nickname   = "Prosimo_AWS"

  aws {
    preferred_auth = "AWSKEY"

    access_keys {
      access_key_id = var.aws_access_key_id
      secret_key_id = var.aws_secret_key_id
    }
  }
}

resource "prosimo_cloud_creds" "azure" {
  cloud_type = "AZURE"
  nickname   = "Prosimo_Azure"

  azure {
    subscription_id = var.azure_subscription_id
    tenant_id       = var.azure_tenant_id
    client_id       = var.azure_client_id
    secret_id       = var.azure_client_secret
  }
}
