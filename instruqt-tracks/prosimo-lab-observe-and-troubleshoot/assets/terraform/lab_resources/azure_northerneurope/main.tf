
# Create Linux and Networking Infrastructure in Azure

module "azure_instances_eu" {
  source = "../modules/azure-resources"
  providers = {
    azurerm = azurerm.eun
  }
  lab_version                = var.lab_version
  for_each                   = var.North_EU_AppSvcs_VNets
  azure_resource_group       = each.value["azure_resource_group"]
  azure_location             = "North Europe"
  azure_vnet_name            = each.value["azure_vnet_name"]
  azure_subnet_name          = each.value["azure_subnet_name"]
  azure_instance_name        = each.value["azure_instance_name"]
  server_port                = each.value["server_port"]
  azure_private_ip           = each.value["azure_private_ip"]
  azure_server_key_pair_name = each.value["azure_server_key_pair_name"]
  azure_vm_size              = "Standard_DS1_v2"
  azure_admin_username       = "linuxuser"
  azure_admin_password       = "admin123"

  azure_subnet_cidr = each.value["azure_subnet_cidr"]
  azure_vnet_cidr   = each.value["azure_vnet_cidr"]
}

#cloud_creds_name = "Peosimo_Azure"

