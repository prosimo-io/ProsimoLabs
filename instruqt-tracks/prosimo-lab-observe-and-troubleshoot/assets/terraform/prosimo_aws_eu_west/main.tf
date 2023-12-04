# initiate required Providers
terraform {
  required_providers {
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

# Create Prosimo Infra resources

module "prosimo_resource_aws_eu_west" {
  source                   = "../modules/prosimo-resources"
  prosimo_teamName         = var.prosimo_team_name
  prosimo_token            = var.prosimo_token
  prosimo_cidr             = var.prosimo_cidr
  cloud                    = "AWS"
  cloud1                   = "Prosimo_AWS"
  apply_node_size_settings = "true"
  bandwidth                = "<1 Gbps"
  instance_type            = "t3.medium"
  multipleRegion           = var.aws_region
  wait                     = "false"
}