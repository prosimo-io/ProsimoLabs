# Prosimo Provider

variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

# Azure Provider

variable "azure_region" {
  type        = string
  description = "azure region"
  default     = "northeurope"
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

# Network Onboarding

variable "network_name" {
  type        = string
  description = "Name of the Prosimo Network"
}

variable "network_namespace" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "northern_europe" 
}

variable "cloud_type" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "public"
}

variable "connection_option" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "private"
}
