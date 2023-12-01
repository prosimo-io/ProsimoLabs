# Create Prosimo Infra resources

module "prosimo_resource_azure" {
  source                   = "./modules/prosimo-resources"
  prosimo_teamName         = var.prosimo_teamName
  prosimo_token            = var.prosimo_token
  prosimo_cidr             = "10.253.0.0/23"
  cloud                    = "AZURE"
  apply_node_size_settings = "false"
  cloud1                   = "Prosimo_Azure"
  multipleRegion           = "northeurope"
  wait                     = "false"

}