# Onboard Networks to Prosimo Fabric

/*
module "network_eu" {
  source            = "../modules/prosimo-network"
  prosimo_team_name = var.prosimo_team_name
  prosimo_token     = var.prosimo_token
  name              = "WEB_Subnet_EU"
  region            = var.aws_region[0]
  subnets           = var.subnet_cidr[0]
  connectivity_type = "vpc-peering"
  placement         = "Workload VPC"
  cloud             = "AWS"
  cloud_type        = "public"
  connect_type      = "private"
  vpc               = module.aws__instances_eu.aws_vpc_id
  cloud_creds_name  = "Prosimo"
  decommission      = "false"
  onboard           = "true"
  depends_on        = [module.prosimo_resource]
}
*/


// Remote Data Source
// "../lab_resources/"

data "terraform_remote_state" "lab_resources" {
  backend = "local"
  config = {
    path = "../../lab_resources/azure_northeurope/terraform.tfstate"
  }
}

locals {
  vnet1_id = data.terraform_remote_state.lab_resources.vnet1_id
  vnet2_id = data.terraform_remote_state.lab_resources.vnet2_id
  vnet1_public_subnets = data.terraform_remote_state.lab_resources.vnet1_public_subnets
  vnet2_public_subnets = data.terraform_remote_state.lab_resources.vnet2_public_subnets
}

/*
Remote State Output List
data.terraform_remote_state.lab_resources.vpc_id_<name>
data.terraform_remote_state.lab_resources.<tgw_id>
data.terraform_remote_state.lab_resources.public_subnets[0]
*/

# Onboard Azure Networks with VNET Peering

resource "prosimo_network_onboarding" "azure_northeurope" {

  name = var.network_name
  namespace = prosimo_namespace.namespace.name
  network_exportable_policy = false
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "Prosimo_Azure"
    region_name = "northeurope"
    cloud_networks {
      vnet = local.vnet1_id
#      hub_id = module.azure_northeurope_vnet1.transit_gw_id
      connector_placement = "Infra VPC"
      connectivity_type = "vnet-peering"
      subnets {
        subnet = local.vnet1_public_subnets
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
      vnet = local.vnet2_id
#      hub_id = module.azure_northeurope_vnet2.transit_gw_id
      connector_placement = "Infra VPC"
      connectivity_type = "vnet-peering"
      subnets {
        subnet = local.vnet2_public_subnets
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