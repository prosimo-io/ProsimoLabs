resource "azurerm_public_ip" "api_fw_lb" {
  name                = "${var.prefix}-publicip"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg_iac.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "api_fw_lb" {
  name                = "TestLoadBalancer"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg_iac.name
  frontend_ip_configuration {
    name                 = "frontend"
    private_ip_address   = "10.20.1.20"
    public_ip_address_id = azurerm_public_ip.api_fw_lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "api_fw" {
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "api_fw_lb_http" {
  name            = "http_probe"
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  protocol        = "Tcp"
  port            = 8080
}

resource "azurerm_lb_probe" "api_fw_lb_ssh" {
  name            = "ssh_probe"
  loadbalancer_id = azurerm_lb.api_fw_lb.id
  protocol        = "Tcp"
  port            = 22
}

resource "azurerm_lb_rule" "api_fw_lb_http" {
  name                           = "http-lb-rule"
  loadbalancer_id                = azurerm_lb.api_fw_lb.id
  probe_id                       = azurerm_lb_probe.api_fw_lb_http.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.api_fw.id]
  frontend_ip_configuration_name = "frontend"
  protocol                       = "Tcp"
  frontend_port                  = "80"
  backend_port                   = "8080"
}

resource "azurerm_lb_rule" "api_fw_lb_ssh" {
  name                           = "ssh-lb-rule"
  loadbalancer_id                = azurerm_lb.api_fw_lb.id
  probe_id                       = azurerm_lb_probe.api_fw_lb_ssh.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.api_fw.id]
  frontend_ip_configuration_name = "frontend"
  protocol                       = "Tcp"
  frontend_port                  = "22"
  backend_port                   = "22"
}
