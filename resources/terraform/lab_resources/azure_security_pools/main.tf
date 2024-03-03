# Create Linux and Networking Infrastructure in Azure

## Wallarm API Firewall

module "azure_northeurope_api_fw_pool" {
  source = "../../modules/azure-resources"
  lab_version                = var.lab_version
  azure_resource_group       = var.api_fw_pool.azure_resource_group
  azure_user_data_file       = var.api_fw_pool.azure_user_data_file
  azure_location             = var.api_fw_pool.azure_location
  azure_vnet_name            = var.api_fw_pool.azure_vnet_name
  azure_subnet_name          = var.api_fw_pool.azure_subnet_name
  azure_instance_name        = var.api_fw_pool.azure_instance_name
  server_port                = var.api_fw_pool.server_port
  azure_private_ip           = var.api_fw_pool.azure_private_ip
  azure_server_key_pair_name = var.api_fw_pool.azure_server_key_pair_name
  azure_vm_size              = var.api_fw_pool.azure_vm_size
  azure_admin_username       = var.api_fw_pool.azure_admin_username
  azure_admin_password       = var.api_fw_pool.azure_admin_password
  azure_subnet_cidr          = var.api_fw_pool.azure_subnet_cidr
  azure_vnet_cidr            = var.api_fw_pool.azure_vnet_cidr
}

## AI Guardrails

## module "azure_northeurope_ai_guardrails_pool" {
##   source = "../../modules/azure-resources"
##   lab_version                = var.lab_version
##   azure_resource_group       = var.ai_guardrails_pool.azure_resource_group
##   azure_user_data_file       = var.ai_guardrails_pool.azure_user_data_file
##   azure_location             = var.ai_guardrails_pool.azure_location
##   azure_vnet_name            = var.ai_guardrails_pool.azure_vnet_name
##   azure_subnet_name          = var.ai_guardrails_pool.azure_subnet_name
##   azure_instance_name        = var.ai_guardrails_pool.azure_instance_name
##   server_port                = var.ai_guardrails_pool.server_port
##   azure_private_ip           = var.ai_guardrails_pool.azure_private_ip
##   azure_server_key_pair_name = var.ai_guardrails_pool.azure_server_key_pair_name
##   azure_vm_size              = var.ai_guardrails_pool.azure_vm_size
##   azure_admin_username       = var.ai_guardrails_pool.azure_admin_username
##   azure_admin_password       = var.ai_guardrails_pool.azure_admin_password
##   azure_subnet_cidr          = var.ai_guardrails_pool.azure_subnet_cidr
##   azure_vnet_cidr            = var.ai_guardrails_pool.azure_vnet_cidr
## }