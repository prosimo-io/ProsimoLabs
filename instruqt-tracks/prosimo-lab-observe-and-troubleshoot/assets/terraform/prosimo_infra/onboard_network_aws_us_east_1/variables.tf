# Prosimo Provider

variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}


# AWS Provider

variable "aws_access_key_id" {
  type        = string
  description = "valid AWS Key"
}

variable "aws_secret_key_id" {
  type        = string
  description = "valid AWS Secret"
}

variable "aws_region" {
  type        = string
  description = "Region for AWS resoruces"
  default     = "us-east-1"
}


# Network Onboarding

variable "network_name" {
  type        = string
  description = "Name of the Prosimo Network"
  default     = "us_east_1" 
}

variable "network_namespace" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "frontend_us_east" 
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
