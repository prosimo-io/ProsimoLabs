resource "azurerm_public_ip" "api_fw_lb" {
  name                = "${var.prefix}-publicip"
  location            = var.api_fw_pool.azure_location
  resource_group_name = module.azure_northeurope_api_fw_pool.azure_rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "api_fw_lb" {
  name                = "TestLoadBalancer"
  location            = var.api_fw_pool.azure_location
  resource_group_name = module.azure_northeurope_api_fw_pool.azure_rg_name
  frontend_ip_configuration {
    name                 = "frontend"
    private_ip_address   = "10.20.1.20"
    public_ip_address_id = azurerm_public_ip.api_fw_lb.id
    subnet_id            = module.azure_northeurope_api_fw_pool.azure_subnet_id
  }
}

resource "azurerm_lb_backend_address_pool" "api_fw" {
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "api_fw" {
  name                    = "api_fw_lb_backend_pool"
  backend_address_pool_id = azurerm_lb_backend_address_pool.api_fw.id
  virtual_network_id      = module.azure_northeurope_api_fw_pool.azure_vnet_id
  ip_address              = "10.20.1.100"
}

resource "azurerm_lb_probe" "api_fw_lb" {
  name            = "probe"
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  protocol        = "Tcp"
  port            = 8080
}

resource "azurerm_lb_rule" "api_fw_lb" {
  name                           = "http-lb-rule"
  loadbalancer_id                = azurerm_lb.api_fw_lb.id
  probe_id                       = azurerm_lb_probe.api_fw_lb.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.api_fw.id]
  frontend_ip_configuration_name = "API_FW_LB_Frontend"
  protocol                       = "Tcp"
  frontend_port                  = "80"
  backend_port                   = "8080"
}