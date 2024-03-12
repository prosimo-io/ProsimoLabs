terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71.0"
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
  rsa_bits  = 4096
}

# save key in our machine
resource "azurerm_ssh_public_key" "example" {
  name                = var.azure_server_key_pair_name
  resource_group_name = azurerm_resource_group.rg_iac.name
  location            = azurerm_resource_group.rg_iac.location
  public_key          = tls_private_key.linux_vm_key.public_key_openssh
  provisioner "local-exec" {
    command = "echo '${tls_private_key.linux_vm_key.private_key_pem}' > ../${var.azure_server_key_pair_name}.pem && chmod 400 ../${var.azure_server_key_pair_name}.pem"
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
  allocation_method   = "Static"
  name                = "public_ip_1"
  resource_group_name = azurerm_resource_group.rg_iac.name
  location            = azurerm_resource_group.rg_iac.location
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
    public_ip_address_id          = azurerm_public_ip.ip_1.id

  }
  depends_on = [
    azurerm_virtual_network.vnet_1,
    azurerm_public_ip.ip_1
  ]
}

locals {
  custom_data = templatefile(var.azure_user_data_file, {
    lab_version = var.lab_version
    server_port = var.server_port
  })
}


resource "azurerm_linux_machine_scale_set" "api_fw" {
  name                = "${var.prefix}-vmss"
  location            = var.api_fw_pool.azure_location
  resource_group_name = module.azure_northeurope_api_fw_pool.azure_rg_name
  instances           = 1
  admin_username        = "linuxuser"

  custom_data           = base64encode(local.custom_data)
  admin_ssh_key {
    username   = "linuxuser"
    public_key = tls_private_key.linux_vm_key.public_key_openssh
  }

  sku {
    name     = "Standard_D1_v2"
    tier     = "Standard"
    capacity = 2
  }

  os_profile {
    computer_name_prefix = "${var.prefix}-vm"
    admin_username       = "myadmin"
    admin_password       = "Passwword1234"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "web_ss_net_profile"
    primary = true

    ip_configuration {
      name                                   = "internal"
      subnet_id                              = azurerm_subnet.subnet_1.id
      primary                                = true
      load_balancer_backend_address_pool_ids = ["${azurerm_lb_backend_address_pool.api_fw.id}"]
      public_ip_address = {
        name = "api_fw_public"
      }
    }
  }

  network_interface {
    name    = "api_fw_nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.subnet_1.id
      load_balancer_backend_address_pool_ids = ["${azurerm_lb_backend_address_pool.api_fw.id}"]
    }
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  depends_on = [
    azurerm_network_interface.nic_1,
    tls_private_key.linux_vm_key
  ]

}


