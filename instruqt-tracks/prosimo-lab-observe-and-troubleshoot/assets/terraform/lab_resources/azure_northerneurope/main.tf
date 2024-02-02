# Create Linux and Networking Infrastructure in Azure

module "azure_instances_eu_vnet1" {
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

module "azure_instances_eu_vnet2" {
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


#cloud_creds_name = "Peosimo_Azure"
