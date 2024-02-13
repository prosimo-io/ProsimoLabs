# initiate required Providers
terraform {
  required_providers {
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
