# Onboard Networks to Prosimo Fabric

data "terraform_remote_state" "lab_resources" {
  backend = "local"
  config = {
    path = "../../lab_resources/aws_us_east_1/terraform.tfstate"
  }
}

locals {
  vpc1_id = data.terraform_remote_state.lab_resources.outputs.vpc1_id
  vpc2_id = data.terraform_remote_state.lab_resources.outputs.vpc2_id
  tgw_id = data.terraform_remote_state.lab_resources.outputs.tgw_us_east_1_id
  public_subnets1 = data.terraform_remote_state.lab_resources.outputs.vpc1_public_subnets
  public_subnets2 = data.terraform_remote_state.lab_resources.outputs.vpc2_public_subnets
}


## Build Transit

# Transit Setup to create edge connection with TGW and VPC
resource "prosimo_visual_transit" "eu_west_1" {
  transit_input {
    cloud_type   = "AWS"  
    cloud_region = var.aws_region
    transit_deployment {
      tgws {
        name = "tgw_us_east_1"
        action = "MOD"
        connection {
          type = "EDGE"
          action = "ADD"
        }
        connection {
          type = "VPC"
          action = "ADD"
          name = "WebSvcsUs1"
        }
        connection {
          type = "VPC"
          action = "ADD"
          name = "WebSvcsUs2"
        }
      }
    }
  }
  deploy_transit_setup = true
}


#AWS with transit gateway and infra vpc
# Onboard VPC Networks to Prosimo Network

resource "prosimo_network_onboarding" "aws_us_east_1" {
  depends_on = [ prosimo_visual_transit.eu_west_1 ]

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
      hub_id = local.tgw_id
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = local.public_subnets1
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
      hub_id = local.tgw_id
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = local.public_subnets2
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
