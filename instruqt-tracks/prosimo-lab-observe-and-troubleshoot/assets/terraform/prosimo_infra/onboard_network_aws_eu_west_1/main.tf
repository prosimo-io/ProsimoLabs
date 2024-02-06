# Onboard Networks to Prosimo Fabric

data "terraform_remote_state" "lab_resources" {
  backend = "local"
  config = {
    path = "../../lab_resources/aws_eu_west_1/terraform.tfstate"
  }
}

locals {
  vpc1_id = data.terraform_remote_state.lab_resources.vpc1_id
  vpc2_id = data.terraform_remote_state.lab_resources.vpc2_id
  tgw1 = data.terraform_remote_state.lab_resources.vpc1_transit_gw_id
  tgw2 = data.terraform_remote_state.lab_resources.vpc2_transit_gw_id
  public_subnets1 = data.terraform_remote_state.lab_resources.vpc1_public_subnets
  public_subnets2 = data.terraform_remote_state.lab_resources.vpc2_public_subnets
}
/*
Remote State Output List
data.terraform_remote_state.lab_resources.vpc_id_<name>
data.terraform_remote_state.lab_resources.<tgw_id>
data.terraform_remote_state.lab_resources.public_subnets[0]
*/

#AWS with transit gateway and infra vpc
# Onboard VPC Networks to Prosimo Network

resource "prosimo_network_onboarding" "aws_eu_west_1" {

  name = var.network_name
  namespace = prosimo_namespace.namespace.name
  network_exportable_policy = false
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "Prosimo_AWS"
    region_name = var.aws_region
    cloud_networks {
      vpc = local.vpc1_id
      hub_id = local.tgw1
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = local.public_subnets1
        # virtual_subnet = "10.250.2.128/25" # Required for overlapping IP
      }
      connector_settings {
        bandwidth_range {
            min = 1
            max = 1
        }
      }
    }
    cloud_networks {
      vpc = local.vpc2_id
      hub_id = local.tgw2
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = local.public_subnets2
        # virtual_subnet = "10.250.2.128/25" # Required for overlapping IP
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
  policies = ["ALLOW-ALL-NETWORKS"]
  onboard_app = true
  decommission_app = false
  wait_for_rollout = false
}

resource "prosimo_namespace" "namespace" {
    name = var.network_namespace
}
