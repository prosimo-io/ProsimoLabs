# Prosimo Provider

variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

# Network Onboarding

variable "source_network_name" {
  type        = string
  description = "Name of the Prosimo Network"
  default     = "northern_europe1"
}

variable "eu_west_1_network_namespace" {
  description = "Name of the Prosimo Namespace to on-board network into"
  type = string
  default = "frontend_eu_west"
}

variable "us_east_1_network_namespace" {
  description = "Name of the Prosimo Namespace to on-board network into"
  type = string
  default = "frontend_us_east"
}

variable "northeurope_network_namespace" {
  description = "Name of the Prosimo Namespace to on-board network into"
  type = string
  default = "app_svcs_north_europe"
}

