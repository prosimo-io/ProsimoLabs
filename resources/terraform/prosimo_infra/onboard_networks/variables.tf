# Prosimo Provider

variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

## # AWS Provider
## 
## variable "aws_access_key_id" {
##   type        = string
##   description = "valid AWS Key"
## }
## 
## variable "aws_secret_key_id" {
##   type        = string
##   description = "valid AWS Secret"
## }
## 
## variable "aws_region" {
##   type        = string
##   description = "Region for AWS resoruces"
##   default     = "eu-west-1"
## }
## 
## # Azure Provider
 
variable "azure_region" {
  type        = string
  description = "azure region"
  default     = "northeurope"
}
 
## variable "azure_subscription_id" {
##   type        = string
##   description = "azure subscription id"
## }
## 
## variable "azure_client_id" {
##   type        = string
##   description = "azure client id"
## }
## 
## variable "azure_client_secret" {
##   type        = string
##   description = "azure client secret"
## }
## 
## variable "azure_tenant_id" {
##   type        = string
##   description = "azure tenant id"
## }


# Network Onboarding

variable "eu_west_1_network_name" {
  type        = string
  description = "Name of the Prosimo Network"
  default     = "eu_west_1"
}

variable "eu_west_1_network_namespace" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "frontend_eu_west"
}

variable "us_east_1_network_name" {
  type        = string
  description = "Name of the Prosimo Network"
  default     = "us_east_1" 
}

variable "us_east_1_network_namespace" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "frontend_us_east" 
}

variable "north_europe_network_name" {
  type        = string
  description = "Name of the Prosimo Network"
  default     = "northern_europe1"
}

variable "north_europe_network_namespace" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "app_svcs_north_europe"
}

variable "cloud_type" {
  type        = string
  description = ""
  default     = "public"
}

variable "connection_option" {
  type        = string
  description = ""
  default     = "private"
}
