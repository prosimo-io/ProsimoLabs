# Onboard Networks to Prosimo Fabric

data "terraform_remote_state" "lab_resources_aws_us_east_1" {
  backend = "local"
  config = {
    path = "../../lab_resources/aws_us_east_1/terraform.tfstate"
  }
}

locals {
  aws_us_east_1_vpc1_id = data.terraform_remote_state.lab_resources_aws_us_east_1.outputs.vpc1_id
  aws_us_east_1_vpc2_id = data.terraform_remote_state.lab_resources_aws_us_east_1.outputs.vpc2_id
  aws_us_east_1_tgw_id = data.terraform_remote_state.lab_resources_aws_us_east_1.outputs.tgw_us_east_1_id
  aws_us_east_1_public_subnets1 = data.terraform_remote_state.lab_resources_aws_us_east_1.outputs.vpc1_public_subnets
  aws_us_east_1_public_subnets2 = data.terraform_remote_state.lab_resources_aws_us_east_1.outputs.vpc2_public_subnets
}


## Build Transit

# Transit Setup to create edge connection with TGW and VPC
resource "prosimo_visual_transit" "us_east_1" {
  transit_input {
    cloud_type   = "AWS"  
    cloud_region = "us-east-1"
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
  depends_on = [ prosimo_visual_transit.us_east_1 ]

  name = var.us_east_1_network_name
  namespace = var.us_east_1_network_namespace
  network_exportable_policy = true
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "Prosimo_AWS"
    region_name = "us-east-1"
    cloud_networks {
      vpc = local.aws_us_east_1_vpc1_id
      hub_id = local.aws_us_east_1_tgw_id
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = local.aws_us_east_1_public_subnets1
      }
      connector_settings {
        bandwidth_range {
            min = 1
            max = 1
        }
      }
    }
    cloud_networks {
      vpc = local.aws_us_east_1_vpc2_id
      hub_id = local.aws_us_east_1_tgw_id
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = local.aws_us_east_1_public_subnets2
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
