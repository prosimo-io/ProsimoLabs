# Onboard Networks to Prosimo Fabric

data "terraform_remote_state" "lab_resources" {
  backend = "local"
  config = {
    path = "../../lab_resources/azure_northeurope/terraform.tfstate"
  }
}

locals {
  vnet1_id = data.terraform_remote_state.lab_resources.outputs.vnet1_id
  vnet2_id = data.terraform_remote_state.lab_resources.outputs.vnet2_id
  vnet1_public_subnets = data.terraform_remote_state.lab_resources.outputs.vnet1_public_subnets
  vnet2_public_subnets = data.terraform_remote_state.lab_resources.outputs.vnet2_public_subnets
}


## Build Transit

# Transit Setup to create edge connection with TGW and VPC
resource "prosimo_visual_transit" "northeurope" {
  transit_input {
    cloud_type   = "AZURE"  
    cloud_region = var.azure_region
    transit_deployment {
      vnets {
        action = "ADD"
        name = "AppSvcsEu1_Vnet"
      }
      vnets {
        action = "ADD"
        name = "AppSvcsEu2_Vnet"
      }
    }
  }
  deploy_transit_setup = true
}


# Onboard Azure Networks with VNET Peering

resource "prosimo_network_onboarding" "azure_northeurope" {
  depends_on = [ prosimo_visual_transit.northeurope ]

  name = var.network_name
  namespace = var.network_namespace
  network_exportable_policy = true
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "Prosimo_Azure"
    region_name = "northeurope"
    cloud_networks {
      vnet = local.vnet1_id
      connector_placement = "Infra VPC"
      connectivity_type = "vnet-peering"
      subnets {
        subnet = local.vnet1_public_subnets
#        virtual_subnet = "192.168.1.0/24"
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
      connector_placement = "Infra VPC"
      connectivity_type = "vnet-peering"
      subnets {
        subnet = local.vnet2_public_subnets
#        virtual_subnet = "192.168.2.0/24"
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
