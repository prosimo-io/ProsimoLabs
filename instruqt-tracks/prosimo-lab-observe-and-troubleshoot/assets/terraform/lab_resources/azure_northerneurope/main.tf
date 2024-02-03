# Create Linux and Networking Infrastructure in Azure

module "azure_northeurope_vnet1" {
  source = "../../modules/azure-resources"
  providers = {
    azurerm = azurerm.eun
  }
  lab_version                = var.lab_version
  azure_resource_group       = var.Vnet1.azure_resource_group
  azure_location             = "North Europe"
  azure_vnet_name            = var.Vnet1.azure_vnet_name
  azure_subnet_name          = var.Vnet1.azure_subnet_name
  azure_instance_name        = var.Vnet1.azure_instance_name
  server_port                = var.Vnet1.server_port
  azure_private_ip           = var.Vnet1.azure_private_ip
  azure_server_key_pair_name = var.Vnet1.azure_server_key_pair_name
  azure_vm_size              = "Standard_DS1_v2"
  azure_admin_username       = "linuxuser"
  azure_admin_password       = "admin123"

  azure_subnet_cidr = var.Vnet1.azure_subnet_cidr
  azure_vnet_cidr   = var.Vnet1.azure_vnet_cidr
}

module "azure_northeurope_vnet2" {
  source = "../../modules/azure-resources"
  providers = {
    azurerm = azurerm.eun
  }
  lab_version                = var.lab_version
  azure_resource_group       = var.Vnet2.azure_resource_group
  azure_location             = "North Europe"
  azure_vnet_name            = var.Vnet2.azure_vnet_name
  azure_subnet_name          = var.Vnet2.azure_subnet_name
  azure_instance_name        = var.Vnet2.azure_instance_name
  server_port                = var.Vnet2.server_port
  azure_private_ip           = var.Vnet2.azure_private_ip
  azure_server_key_pair_name = var.Vnet2.azure_server_key_pair_name
  azure_vm_size              = "Standard_DS1_v2"
  azure_admin_username       = "linuxuser"
  azure_admin_password       = "admin123"

  azure_subnet_cidr = var.Vnet2.azure_subnet_cidr
  azure_vnet_cidr   = var.Vnet2.azure_vnet_cidr
}


# Onboard VPC Networks to Prosimo Network

resource "prosimo_network_onboarding" "azure_northeurope" {

  name = var.network_name
  namespace = prosimo_namespace.namespace.name
  network_exportable_policy = false
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "Prosimo_Azure"
    region_name = var.azure_region
    cloud_networks {
      vnet = module.azure_northeurope_vnet1.azure_vnet_id
#      hub_id = module.azure_northeurope_vnet1.transit_gw_id
      connector_placement = "Infra VPC"
      connectivity_type = "vnet-peering"
      subnets {
        subnet = var.Vnet1.azure_vnet_cidr
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
      vnet = module.azure_northeurope_vnet2.azure_vnet_id
#      hub_id = module.azure_northeurope_vnet2.transit_gw_id
      connector_placement = "Infra VPC"
      connectivity_type = "vnet-peering"
      subnets {
        subnet = var.Vnet2.azure_vnet_cidr
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