// Create CSP account


// Defining CIDRs as a prerequisite for Prosimo Fabric Deployment
resource "prosimo_ip_addresses" "aws_ip_address" {
  cidr        = var.prosimo_cidr
  cloud_type  = var.cloud
//  depends_on = [prosimo_edge.multiple]
}

// Creating Edge gateways across various Regions
resource "prosimo_edge" "multiple" {
  cloud_name       = var.cloud1
  cloud_region     = var.multipleRegion
  wait_for_rollout = var.wait
  depends_on       = [prosimo_ip_addresses.aws_ip_address]
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
            bandwidth = "small"
            bandwidth_name = "<1 Gbps"
            instance_type = "t3.medium"
          }
        }
}
*/
