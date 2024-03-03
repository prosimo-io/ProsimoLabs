Vnet1 = {
  azure_resource_group       = "AppSvcsEu1"
  azure_location             = "North Europe"
  azure_vnet_name            = "AppSvcsEu1_Vnet"
  azure_subnet_name          = "AppSvcsEu1_Vnet_subnet"
  azure_instance_name        = "AppSvcsEu1"
  azure_user_data_file       = "/root/prosimo-lab/assets/scripts/azure-user-data.sh"
  server_port                = "3000"
  azure_vm_size              = "Standard_DS1_v2"
  azure_server_key_pair_name = "Azure_Srv1"
  azure_admin_username       = "igorlinux"
  azure_admin_password       = "igorlinux"
  azure_vnet_cidr            = "10.100.0.0/16"
  azure_subnet_cidr          = "10.100.1.0/24"
  azure_private_ip           = "10.100.1.100"
}

Vnet2 = {
  azure_resource_group       = "AppSvcsEu2"
  azure_location             = "North Europe"
  azure_vnet_name            = "AppSvcsEu2_Vnet"
  azure_subnet_name          = "AppSvcsEu2_Vnet_subnet"
  azure_instance_name        = "AppSvcsEu2"
  azure_user_data_file       = "/root/prosimo-lab/assets/scripts/azure-user-data.sh"
  server_port                = "3000"
  azure_vm_size              = "Standard_DS1_v2"
  azure_server_key_pair_name = "Azure_Srv2"
  azure_admin_username       = "igorlinux"
  azure_admin_password       = "igorlinux"
  azure_vnet_cidr            = "10.200.0.0/16"
  azure_subnet_cidr          = "10.200.2.0/24"
  azure_private_ip           = "10.200.2.100"
}
