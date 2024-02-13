resource "prosimo_network_onboarding" "network" {
  network_exportable_policy = false
  name                      = var.name
  namespace = "default"

  public_cloud {
    cloud_type        = var.cloud_type
    connection_option = var.connect_type
    cloud_creds_name  = var.cloud_creds_name
    region_name       = var.region
    cloud_networks {
      vpc                 = var.vpc
      connector_placement = var.placement
      connectivity_type   = var.connectivity_type
      subnets {
        subnet = var.subnets[0]
#        virtual_subnet = "10.250.2.128/25" # For Overlapping IPs
      }
      connector_settings {
        bandwidth_range {
            min = 1
            max = 1
        }
      }
    }
    connect_type = "connector"
  }
  policies         = ["ALLOW-ALL-NETWORKS"]
  onboard_app      = var.onboard
  decommission_app = var.decommission
}

/* Example: From Github Provider v3.10.9
resource "prosimo_network_onboarding" "testapp-AWS-Infra-vpc" {

    name = "demo_network_aws"
    namespace = "default"
    network_exportable_policy = false
    public_cloud {
        cloud_type = "public"
        connection_option = "private"
        cloud_creds_name = "prosimo-aws-iam"
        region_name = "us-east-2"
        cloud_networks {
          vpc = "vpc-a8892dc3"
          hub_id = "tgw-04d69a6cd846cd26b"
          connector_placement = "Infra VPC"
          connectivity_type = "transit-gateway"
          subnets {
            subnet = "10.250.2.128/25"
            virtual_subnet = "10.250.2.128/25"
          }
          connector_settings {
            bandwidth_range {
                min = 3
                max = 5
            }
          }
        }

        connect_type = "connector"

    }
    policies = ["ALLOW-ALL-NETWORKS"]
    onboard_app = false
    decommission_app = false
}
*/