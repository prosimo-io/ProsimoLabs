resource "azurerm_lb" "api_fw_lb" {
  name                = "TestLoadBalancer"
  location            = var.api_fw_pool.azure_location
  resource_group_name = module.azure_northeurope_api_fw_pool.azure_rg_name
  frontend_ip_configuration {
    name               = "frontend"
    private_ip_address = "10.20.1.20"
    subnet_id          = module.azure_northeurope_api_fw_pool.azure_subnet_id
  }
}

resource "azurerm_lb_backend_address_pool" "api_fw" {
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "api_fw" {
  name                    = "example"
  backend_address_pool_id = azurerm_lb_backend_address_pool.api_fw.id
  virtual_network_id      = module.azure_northeurope_api_fw_pool.azure_vnet_id
  ip_address              = "10.20.1.100"
}