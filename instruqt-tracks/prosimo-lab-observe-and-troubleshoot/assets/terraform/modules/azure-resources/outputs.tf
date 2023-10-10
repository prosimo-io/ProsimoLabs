# Print Azure Instance Public
output "azure_vm_public_ip" {
  value = azurerm_public_ip.ip_1.ip_address
}

output "ssh_access" {
  value = "ssh -i '~/prosimo-lab/assets/terraform/${var.azure_server_key_pair_name}.pem' linuxuser@${azurerm_public_ip.ip_1.ip_address}"
}