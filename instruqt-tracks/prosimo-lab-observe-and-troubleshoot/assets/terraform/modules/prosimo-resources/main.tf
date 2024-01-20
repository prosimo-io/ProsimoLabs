// Creating Edge gateways across various Regions 
resource "prosimo_edge" "edge" {
  cloud_name       = var.cloud1
  cloud_region     = var.multipleRegion
  wait_for_rollout = var.wait
  ip_range         = var.prosimo_cidr
  node_size_settings {
#    bandwidth     = "<1 Gbps"
#    instance_type = "t3.medium"
    bandwidth_range { # Ready for provider upgrade
      min = 1
      max = 1
    }  
  }
  deploy_edge       = true
  decommission_edge = false
}

/*
resource "prosimo_network_onboarding" "network" {

    count = var.tgw ? 1 : 0
    name = var.aws_subnet_name
    public_cloud {
        cloud_type = var.cloud_type
        connection_option = var.connection_option
        region_name = var.aws_region
        cloud_networks {
          vpc = var.vpc_name
          connector_placement = "Infra VPC"
          connectivity_type = "vpc_peering"
          subnets = [var.subnets]
          connector_settings {
            bandwidth_range {
                min = 1
                max = 1
            }
          }
        }
}
*/
