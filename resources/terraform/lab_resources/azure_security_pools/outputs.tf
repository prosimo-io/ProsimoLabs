## Output variable definitions

output "ssh_access_azure_api_fw_eu" {
  value = module.azure_northeurope_api_fw_pool.ssh_access
}

output "azure_vm_api_fw_eu_public_ip" {
  value = module.azure_northeurope_api_fw_pool.azure_vm_public_ip
}

output "all_output" {
  value = module.azure_northeurope_api_fw_pool.all_output
  sensitive = true
}

# output "azure_vm_api_fw_eu_instance0_public_ip" {
# #  value = module.azure_northeurope_api_fw_pool.network_interface.ip_configuration.public_ip_address
#   value = module.azure_northeurope_api_fw_pool.network_interface  ##TODO: Trying to get this working
# }

output "azure_northeurope_api_fw_pool_vnet_id" {
  value = module.azure_northeurope_api_fw_pool.azure_vnet_id
}

output "api_fw_eu_public_subnets" {
  value = module.azure_northeurope_api_fw_pool.public_subnets[0]
}
