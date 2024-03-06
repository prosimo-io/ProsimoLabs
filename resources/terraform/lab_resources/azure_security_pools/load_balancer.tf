data "azurerm_resource_group" "api_fw_rg" {
  name     = var.api_fw_pool.azure_resource_group
  location = "North Europe"
}

data "azurerm_subnet" "apif_fw" {
  name                 = "default"
  virtual_network_name = data.azurerm_virtual_network.api_fw.name
  resource_group_name  = data.azurerm_resource_group.api_fw_rg.name
}

resource "azurerm_lb" "api_fw_lb" {
  name                = "TestLoadBalancer"
  location            = var.api_fw_pool.azure_location
  resource_group_name = data.azurerm_resource_group.api_fw_rg.name
  frontend_ip_configuration {
    name               = "frontend"
    private_ip_address = "10.20.1.20"
    subnet_id          = data.azurerm_subnet.apif_fw.id
  }

}
resource "azurerm_lb_backend_address_pool" "api_fw" {
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "api_fw" {
  name                    = "example"
  backend_address_pool_id = azurerm_lb_backend_address_pool.api_fw.id
  virtual_network_id      = data.azurerm_virtual_network.api_fw.id
  ip_address              = "10.20.1.100"
}

data "azurerm_virtual_network" "api_fw" {
  name                = "ApiFwEu_Vnet"
  resource_group_name = "ApiFwEu"
}

