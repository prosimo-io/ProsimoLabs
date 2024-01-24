# initiate required Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
    prosimo = {
      source  = "prosimo-io/prosimo"
      version = "~> 3.10.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  #  shared_credentials_files = ["./credentials"]
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_key_id
  profile    = "default"
}

provider "prosimo" {
  token    = var.prosimo_token
  insecure = true
  base_url = "https://${var.prosimo_team_name}.admin.prosimo.io"
}
