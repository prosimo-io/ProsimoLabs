variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

variable "azure_subscription_id" {
  type        = string
  description = "azure subscription id"
}

variable "azure_tenant_id" {
  type        = string
  description = "azure tenant id"
}

variable "azure_client_id" {
  type        = string
  description = "azure client id"
}

variable "azure_client_secret" {
  type        = string
  description = "azure client secret"
}
