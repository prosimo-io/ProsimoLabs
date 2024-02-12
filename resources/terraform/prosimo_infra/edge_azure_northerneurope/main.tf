# Deploy Prsimo Edge on Azure

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