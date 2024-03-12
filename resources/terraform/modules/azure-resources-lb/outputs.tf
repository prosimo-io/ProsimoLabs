# Print Azure Instance Public
output "azure_vm_public_ip" {
  value = azurerm_public_ip.ip_1.ip_address
}

#output "ssh_access" {
#  value = "${var.azure_instance_name} - ${azurerm_linux_virtual_machine_scale_set.api_fw.private_ip_address} =>  ssh -i './${var.azure_server_key_pair_name}.pem' linuxuser@${azurerm_public_ip.ip_1.ip_address}"
#}

#output "ssh_access" {
#  value = "${var.azure_instance_name} =>  ssh -i './${var.azure_server_key_pair_name}.pem' linuxuser@${azurerm_public_ip.ip_1.ip_address}"
#}

output "azure_vnet_id" {
  value = azurerm_virtual_network.vnet_1.id
}

output "azure_vnet_name" {
  value = azurerm_virtual_network.vnet_1.name
}

output "azure_subnet_id" {
  value = azurerm_subnet.subnet_1.id
}

output "azure_rg_name" {
  value = azurerm_resource_group.rg_iac.name
}

output "public_subnets" {
  value = azurerm_subnet.subnet_1.address_prefixes
}
