resource "prosimo_network_onboarding" "testapp-s3" {
  network_exportable_policy = false
  name                      = var.name
  public_cloud {
    cloud_type        = var.cloud_type
    connection_option = var.connect_type
    cloud_creds_name  = var.cloud_creds_name
    region_name       = var.region
    cloud_networks {
      vpc                 = var.vpc
      connector_placement = var.placement
      connectivity_type   = var.connectivity_type
      subnets             = [var.subnets]
      connector_settings {
        bandwidth     = "<1 Gbps"
        instance_type = "t3.medium"
      }
    }
    connect_type = "connector"
  }
  policies         = ["ALLOW-ALL-NETWORKS"]
  onboard_app      = var.onboard
  decommission_app = var.decommission
}
