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

# Prosimo Edge Settings

variable "cloud_name" {
  type        = string
  description = "Prosimo Edge - name of cloud e.g. 'Prosimo_AWS'"
}

variable "wait_for_rollout" {
  type        = bool
  description = "Wait for edge deployment to finish - might hit API timeout before complete so default to false"
  default     = false
}

variable "azure_region" {
  type        = string
  description = "azure client secret"
  default     = "northeurope"
}

variable "prosimo_cidr" {
  type        = string
  description = "valid subnets to assign to server"
  default     = "10.253.0.0/23"
}
