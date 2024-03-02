terraform {
  required_providers {
##    aws = {
##      source  = "hashicorp/aws"
##      version = "~> 5.20.0"
##    }
    prosimo = {
      source  = "prosimo-io/prosimo"
      version = "~> 4.1.0"
    }
  }
}

provider "prosimo" {
  token    = var.prosimo_token
  insecure = true
  base_url = "https://${var.prosimo_team_name}.admin.prosimo.io"
}

## provider "aws" {
##   region = "eu-west-1"
##   alias = "eu-west-1"
##   profile = "default"
## }
## 
## provider "aws" {
##   region = "us-east-1"
##   alias  = "us-east-1"
##   profile = "default"
## }
