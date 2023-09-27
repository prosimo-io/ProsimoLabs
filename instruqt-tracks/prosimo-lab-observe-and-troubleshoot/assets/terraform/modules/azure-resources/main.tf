terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }

  }
}

# Create a Resource Group
resource "azurerm_resource_group" "rg_iac" {
  name     = var.azure_resource_group
  location = var.azure_location
}

# tls for ssh key
resource "tls_private_key" "linux_vm_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# save key in our machine
resource "azurerm_ssh_public_key" "example" {
  name                = var.azure_server_key_pair_name
  resource_group_name = azurerm_resource_group.rg_iac.name
  location            = azurerm_resource_group.rg_iac.location
  public_key          = tls_private_key.linux_vm_key.public_key_openssh
  provisioner "local-exec"{
  command = "echo '${tls_private_key.linux_vm_key.private_key_pem}' > ./${var.azure_server_key_pair_name}.pem"
}
}
# Create a VNet
resource "azurerm_virtual_network" "vnet_1" {
  resource_group_name = azurerm_resource_group.rg_iac.name
  name                = var.azure_vnet_name
  address_space       = [var.azure_vnet_cidr]
  location            = azurerm_resource_group.rg_iac.location
}

# Create a Subnet
resource "azurerm_subnet" "subnet_1" {
  address_prefixes     = [var.azure_subnet_cidr]
  resource_group_name  = azurerm_resource_group.rg_iac.name
  virtual_network_name = azurerm_virtual_network.vnet_1.name
  name                 = var.azure_subnet_name
  depends_on = [
    azurerm_virtual_network.vnet_1
  ]
}

# Create a Public IP
resource "azurerm_public_ip" "ip_1" {
  allocation_method = "Static"
  name = "public_ip_1"
  resource_group_name = azurerm_resource_group.rg_iac.name
  location = azurerm_resource_group.rg_iac.location
}

# Create a Network Interface
resource "azurerm_network_interface" "nic_1" {
  name                = "nic_1"
  location            = azurerm_resource_group.rg_iac.location
  resource_group_name = azurerm_resource_group.rg_iac.name
  ip_configuration {
    name                          = "nic_ip"
    subnet_id                     = azurerm_subnet.subnet_1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.azure_private_ip
    public_ip_address_id = azurerm_public_ip.ip_1.id
  }
  depends_on = [
    azurerm_virtual_network.vnet_1,
    azurerm_public_ip.ip_1
  ]
}
data "template_file" "apache_install" {
    template = file("/root/prosimo-lab/assets/scripts/azure-user-data.sh")
}

# Create a VM
resource "azurerm_linux_virtual_machine" "vm_1" {
  name                = var.azure_instance_name
  location            = azurerm_resource_group.rg_iac.location
  resource_group_name = azurerm_resource_group.rg_iac.name
  size             = var.azure_vm_size
  network_interface_ids = [azurerm_network_interface.nic_1.id]
  admin_username = "linuxuser"
  custom_data = base64encode(data.template_file.apache_install.rendered)
  admin_ssh_key {
    username   = "linuxuser"
    public_key = tls_private_key.linux_vm_key.public_key_openssh
  }
  os_disk {
  caching = "ReadWrite"
  storage_account_type = "Standard_LRS"
  }

  source_image_reference {
  publisher = "Canonical"
  offer = "UbuntuServer"
  sku = "16.04-LTS"
  version = "latest"
  }
  
  depends_on = [
    azurerm_network_interface.nic_1,
    tls_private_key.linux_vm_key
  ]

}
