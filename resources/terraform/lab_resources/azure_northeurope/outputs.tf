## Output variable definitions

output "ssh_access_azure_eu_1" {
  value = module.azure_northeurope_vnet1.ssh_access
}

output "ssh_access_azure_eu_2" {
  value = module.azure_northeurope_vnet2.ssh_access
}

output "vnet1_id" {
  value = module.azure_northeurope_vnet1.azure_vnet_id
}

output "vnet2_id" {
  value = module.azure_northeurope_vnet2.azure_vnet_id
}

output "vnet1_public_subnets" {
  value = module.azure_northeurope_vnet1.public_subnets[0]
}

output "vnet2_public_subnets" {
  value = module.azure_northeurope_vnet2.public_subnets[0]
}
