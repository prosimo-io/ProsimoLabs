lab_version = "n8-updates" // Add this to setup-shell: https://stackoverflow.com/questions/17414104/git-checkout-latest-tag

Vnet1 = {
  azure_resource_group       = "AppSvcsProdEu"
  azure_location             = "North Europe"
  azure_vnet_name            = "AppSvcsProdEu_Vnet"
  azure_subnet_name          = "AppSvcsProdEu_Vnet_subnet"
  azure_instance_name        = "AppSvcsProdEu"
  server_port                = "3000"
  azure_vm_size              = "Standard_DS1_v2"
  azure_server_key_pair_name = "Azure_Srv1"
  azure_admin_username       = "igorlinux"
  azure_admin_password       = "igorlinux"
  azure_subnet_cidr          = "10.0.0.0/24"
  azure_vnet_cidr            = "10.0.0.0/16"
  azure_private_ip           = "10.0.0.100"
}

Vnet2 = {
  azure_resource_group       = "AppSvcsDevEu"
  azure_location             = "North Europe"
  azure_vnet_name            = "AppSvcsDevEu_Vnet"
  azure_subnet_name          = "AppSvcsDevEu_Vnet_subnet"
  azure_instance_name        = "AppSvcsDevEu"
  server_port                = "3000"
  azure_vm_size              = "Standard_DS1_v2"
  azure_server_key_pair_name = "Azure_Srv2"
  azure_admin_username       = "igorlinux"
  azure_admin_password       = "igorlinux"
  azure_subnet_cidr          = "10.1.0.0/24"
  azure_vnet_cidr            = "10.1.0.0/16"
  azure_private_ip           = "10.1.0.100"
}

