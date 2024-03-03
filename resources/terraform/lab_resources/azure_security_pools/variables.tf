
variable "lab_version" {
  type        = string
  description = "Release Version (GitHub Tag) of this Lab"
}

variable "azure_subscription_id" {
  type        = string
  description = "azure subscription id"
}

variable "azure_client_id" {
  type        = string
  description = "azure client id"
}

variable "azure_client_secret" {
  type        = string
  description = "azure client secret"
}

variable "azure_tenant_id" {
  type        = string
  description = "azure tenant id"
}

variable "azure_region" {
  type        = string
  description = "azure region"
  default     = "northeurope"
}

variable "api_fw_pool" {
  type = object({
    azure_resource_group       = string
    azure_vnet_name            = string
    azure_location             = string
    azure_subnet_name          = string
    azure_instance_name        = string
    azure_user_data_file       = string
    server_port                = string
    azure_server_key_pair_name = string
    azure_private_ip           = string
    azure_vm_size              = string
    azure_subnet_cidr          = string
    azure_vnet_cidr            = string
    azure_admin_username       = string
    azure_admin_password       = string
  })
}

variable "ai_guardrails_pool" {
  type = object({
    azure_resource_group       = string
    azure_location             = string
    azure_vnet_name            = string
    azure_subnet_name          = string
    azure_instance_name        = string
    azure_user_data_file       = string
    server_port                = string
    azure_server_key_pair_name = string
    azure_private_ip           = string
    azure_vm_size              = string
    azure_subnet_cidr          = string
    azure_vnet_cidr            = string
    azure_admin_username       = string
    azure_admin_password       = string
  })
}
