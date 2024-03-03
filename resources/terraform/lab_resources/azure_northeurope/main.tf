# Create Linux and Networking Infrastructure in Azure

module "azure_northeurope_vnet1" {
  source = "../../modules/azure-resources"
  lab_version                = var.lab_version
  azure_resource_group       = var.Vnet1.azure_resource_group
  azure_location             = var.Vnet1.azure_location
  azure_vnet_name            = var.Vnet1.azure_vnet_name
  azure_subnet_name          = var.Vnet1.azure_subnet_name
  azure_instance_name        = var.Vnet1.azure_instance_name
  azure_user_data_file       = var.Vnet1.azure_user_data_file
  server_port                = var.Vnet1.server_port
  azure_private_ip           = var.Vnet1.azure_private_ip
  azure_server_key_pair_name = var.Vnet1.azure_server_key_pair_name
  azure_vm_size              = var.Vnet1.azure_vm_size
  azure_admin_username       = var.Vnet1.azure_admin_username
  azure_admin_password       = var.Vnet1.azure_admin_password
  azure_subnet_cidr          = var.Vnet1.azure_subnet_cidr
  azure_vnet_cidr            = var.Vnet1.azure_vnet_cidr
}

module "azure_northeurope_vnet2" {
  source = "../../modules/azure-resources"
  lab_version                = var.lab_version
  azure_resource_group       = var.Vnet2.azure_resource_group
  azure_location             = var.Vnet2.azure_location
  azure_vnet_name            = var.Vnet2.azure_vnet_name
  azure_subnet_name          = var.Vnet2.azure_subnet_name
  azure_instance_name        = var.Vnet2.azure_instance_name
  azure_user_data_file       = var.Vnet1.azure_user_data_file
  server_port                = var.Vnet2.server_port
  azure_private_ip           = var.Vnet2.azure_private_ip
  azure_server_key_pair_name = var.Vnet2.azure_server_key_pair_name
  azure_vm_size              = var.Vnet2.azure_vm_size
  azure_admin_username       = var.Vnet2.azure_admin_username
  azure_admin_password       = var.Vnet2.azure_admin_password
  azure_subnet_cidr          = var.Vnet2.azure_subnet_cidr
  azure_vnet_cidr            = var.Vnet2.azure_vnet_cidr
}
