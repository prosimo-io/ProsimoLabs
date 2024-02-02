# module "prosimo_resource_azure" {
#   source           = "../../modules/prosimo-resources"
#   prosimo_teamName = var.prosimo_team_name
#   prosimo_token    = var.prosimo_token
#   prosimo_cidr     = "10.253.0.0/23"
#   cloud            = "AZURE"
#   cloud1           = "Prosimo_Azure"
#   multipleRegion   = "northeurope"
#   wait             = "false"
# 
# }

resource "prosimo_edge" "edge" {
  cloud_name       = var.cloud_name
  cloud_region     = var.azure_region
  wait_for_rollout = var.wait_for_rollout
  ip_range         = var.prosimo_cidr
  node_size_settings {
    bandwidth_range {
      min = 1
      max = 1
    }
  }
  deploy_edge       = true
  decommission_edge = false
}